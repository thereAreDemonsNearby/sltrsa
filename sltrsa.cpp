#include <fmt/format.h>
#include <cstdlib>
#include <utility>
#include <cstring>
#include <future>
#include <filesystem>
#include <string>
#include "ntalgo.hpp"
#include "TimerGuard.h"

static bool toNumber(char const* str, std::size_t* n)
{
    char* end;
    *n = std::strtoul(str, &end, 10);
    if (*end != '\0' || errno == ERANGE) {
        return false;
    } else {
        return true;
    }
}

template<std::size_t KeyBits>
void encrypt(const char* src, const char* dst, const char* keyFile);

template<std::size_t KeyBits>
void decrypt(const char* src, const char* dst, const char* keyFile);

template<std::size_t CipherChunkBits>
BigUInt<CipherChunkBits> decryptUsingChineseRemainderTheorem_par(
    BigUInt<CipherChunkBits> const& cipher, BigUInt<CipherChunkBits> const& d,
    BigUInt<CipherChunkBits> const& n, BigUInt<CipherChunkBits/2> const& p,
    BigUInt<CipherChunkBits/2> const& q, BigUInt<CipherChunkBits/2> const& pInv,
    BigUInt<CipherChunkBits/2> const& qInv,
    ContextOfMontgomery<CipherChunkBits/2> const& pContext,
    ContextOfMontgomery<CipherChunkBits/2> const& qContext);

namespace fs = std::filesystem;

static bool parallel = false;
static int threadNum = 1;

int main(int argc, char* argv[])
{
    std::File* keyFile;
    std::File* src;
    std::File* dst;
    std::size_t srcSize;
    
    std::size_t idx = 1;
    if (idx < argc && std::strcmp(argv[idx], "--help") == 0) {
        fmt::print(stderr, "{} [-p threadNum] <key> [src] [dest]", argv[0])
        std::exit(0);
    }
    
    if (idx < argc && std::strcmp(argv[idx], "-p") == 0) {
        // enable parallel
        ++idx;
        parallel = true;
        // read thread num
        std::size_t tn;
        if (idx < argc && toNumber(argv[idx], &tn)) {
            ++idx;
            threadNum = static_cast<int>(tn);            
        } else {
            fmt::print(stderr, "lack thread number after -p\n");
            std::exit(1);
        }
    } else {
        parallel = false;
    }
    
    if (idx < argc) {
        ++idx;
        if ((keyFile = std::fopen(argv[idx], "r")) == NULL) {
            std::string msg = fmt::format("cannot open key file {}", argv[1]);
            std::perror(msg.c_str());
            std::exit(2);
        }
    } else {
        fmt::print(stderr, "no key file specified\n");
        std::exit(3);
    }

    if (idx < argc) {
        if ((src = std::fopen(argv[idx], "rb")) == NULL) {
            auto msg = fmt::format("cannot open file {}", argv[idx]);
            std::perror(msg.c_str());
            std::exit(3);
        }
        ++idx;
        if (idx < argc) {
            if ((dest = std::fopen(argv[idx], "rb")) == NULL) {
                auto msg = fmt::format("cannot open file {}", argv[idx]);
                std::perror(msg.c_str());
                std::exit(4);
            }
            ++idx;
            if (idx < argc) {
                fmt::print(stderr, "too much argument\n");
                std::exit(5);
            }
        } else {
            dest = stdout;
        }
    } else {
        src = stdin;
        dest = stdout;
    }    
}

template<std::size_t KeyBits>
void encrypt(const char* src, const char* dst, const char* keyFile)
{
    std::FILE* fpsrc = std::fopen(src, "rb");
    if (!fpsrc) {
	std::fprintf(stderr, "cannot open %s\n", src);
	std::exit(1);
    }

    std::FILE* fpdst = std::fopen(dst, "wb");
    if (!fpdst) {
	std::fprintf(stderr, "cannot open %s\n", dst);
	std::exit(1);
    }

    BigUInt<PrimeBits * 2> e, n;
    readKeys(keyFile, e, n);
    ContextOfMontgomery<PrimeBits * 2> context(n);
    
    std::size_t srcsz = fileSize(fpsrc);
    std::fwrite(&srcsz, sizeof(srcsz), 1, fpdst);
    
    std::size_t nread;
    BigUInt<CipherUnitBytes * 8> plainBuff;
    for (;;) {
	plainBuff = 0;
	nread = std::fread(plainBuff.data().data(), 1, PlainUnitBytes, fpsrc);
	if (nread < PlainUnitBytes) {
	    if (std::ferror(fpsrc)) {
		std::fprintf(stderr, "fread error\n");
		std::exit(2);
	    } else {
		if (nread == 0)
		    break;
	    }
	}

	auto encrypted = modularExp_montgomery(plainBuff, e, n, context);
	if (std::fwrite(encrypted.data().data(), 1, CipherUnitBytes, fpdst) != CipherUnitBytes) {
	    std::fprintf(stderr, "fwrite error\n");
	    std::exit(2);
	}
    }

    std::fclose(fpsrc);
    std::fclose(fpdst);
}

template<std::size_t KeyBits>
void decrypt(const char* src, const char* dst, const char* keyFile)
{
    std::FILE* fpsrc = std::fopen(src, "rb");
    if (!fpsrc) {
	std::fprintf(stderr, "cannot open %s\n", src);
	std::exit(3);
    }

    std::FILE* fpdst = std::fopen(dst, "wb");
    if (!fpdst) {
	std::fprintf(stderr, "cannot open %s\n", dst);
	std::exit(3);
    }

    BigUInt<2*PrimeBits> d, n;
    BigUInt<PrimeBits> p, q, pInv, qInv;
    readKeys(keyFile, d, n, p, q, pInv, qInv);
    ContextOfMontgomery<PrimeBits> pContext(p);
    ContextOfMontgomery<PrimeBits> qContext(q);

    std::size_t dstsz;
    if (std::fread(&dstsz, sizeof(std::size_t), 1, fpsrc) != 1) {
	std::fprintf(stderr, "cannot read size of the original file\n");
	std::exit(3);
    }

    std::size_t nread;
    BigUInt<CipherUnitBytes * 8> cipherBuff;
    for (;;) {
	cipherBuff = 0;
	nread = std::fread(cipherBuff.data().data(), 1, CipherUnitBytes, fpsrc);
	if (nread < CipherUnitBytes) {
	    if (std::ferror(fpsrc)) {
		std::fprintf(stderr, "fread error\n");
		std::exit(3);
	    } else {
		if (nread == 0)
		    break;
		else {
		    std::fprintf(stderr, "format error\n");
		    std::exit(3);
		}
	    }
	}

	std::size_t nwrite;
	if (dstsz >= PlainUnitBytes) {
	    nwrite = PlainUnitBytes;
	} else {
	    nwrite = dstsz;
	}
	dstsz -= nwrite;

	BigUInt<CipherUnitBytes * 8> decrypted
	    = decryptUsingChineseRemainderTheorem_par(cipherBuff, d, n, p, q,
						      pInv, qInv, pContext, qContext);
	if (std::fwrite(decrypted.data().data(), 1, nwrite, fpdst) != nwrite) {
	    std::fprintf(stderr, "fwrite error\n");
	    std::exit(3);
	}
    }

    std::fclose(fpsrc);
    std::fclose(fpdst);
}

std::size_t fileSize(std::FILE* fp)
{
    auto curr = std::ftell(fp);
    std::fseek(fp, 0, SEEK_END);
    auto size = std::ftell(fp);
    std::fseek(fp, curr, SEEK_SET);

    return size;
}

// e n
// d n p q pInv qInv
template<typename... BIGUINTS>
void readKeys(const char* keyfile, BIGUINTS&... args)
{
    std::FILE* fp = std::fopen(keyfile, "rb");
    if (!fp) {
	std::string msg = fmt::format("cannot open {}", keyfile);
	std::perror(msg.c_str());
	std::exit(1);
    }
    
    size_t shouldRead = (args.data().size() + ...);
    size_t read = (std::fread(args.data().data(), sizeof(uint32_t), args.data().size(), fp) + ...);
    if (read < shouldRead) {
	std::perror("didn't read a complete key");
	std::exit(3);
    }
}

template<std::size_t CipherChunkBits>
BigUInt<CipherChunkBits> decryptUsingChineseRemainderTheorem_par(
    BigUInt<CipherChunkBits> const& cipher, BigUInt<CipherChunkBits> const& d,
    BigUInt<CipherChunkBits> const& n, BigUInt<CipherChunkBits/2> const& p,
    BigUInt<CipherChunkBits/2> const& q, BigUInt<CipherChunkBits/2> const& pInv,
    BigUInt<CipherChunkBits/2> const& qInv,
    ContextOfMontgomery<CipherChunkBits/2> const& pContext,
    ContextOfMontgomery<CipherChunkBits/2> const& qContext)
{
    // std::future<BigUInt<CipherChunkBits/2>>
    //     fut1 = std::async([&](){
    //     		      auto cipher1 = modLess(cipher, p);
    //     		      auto d1 = modLess(d, p - 1);
    //     		      return modularExp_montgomery(cipher1, d1, p, pContext);
    //     		  }),
    //     fut2 = std::async([&](){
    //     		      auto cipher2 = modLess(cipher, q);
    //     		      auto d2 = modLess(d, q - 1);
    //     		      return modularExp_montgomery(cipher2, d2, q, qContext);
    //     		  });

    // auto m1 = fut1.get();
    // auto m2 = fut2.get();
    auto cipher1 = modLess(cipher, p);
    auto d1 = modLess(d, p - 1);
    auto m1 = modularExp_montgomery(cipher1, d1, p, pContext);
    auto cipher2 = modLess(cipher, q);
    auto d2 = modLess(d, q - 1);
    auto m2 = modularExp_montgomery(cipher2, d2, q, qContext);

    auto exN = n.template resize<CipherChunkBits*2>();
    auto m = fullMultiply(fullMultiply(m1, q), qInv.template resize<CipherChunkBits>())
	+ fullMultiply(fullMultiply(m2, p), pInv.template resize<CipherChunkBits>());
    m = m % exN;
    return m.template resize<CipherChunkBits>();
}
