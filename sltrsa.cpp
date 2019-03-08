#include <fmt/format.h>
#include <cstdlib>
#include <utility>
#include <cstring>
#include <future>
#include "ntalgo.hpp"
#include "TimerGuard.h"

static constexpr std::size_t PrimeBits = 1024;
static constexpr std::size_t PlainUnitBytes = PrimeBits / 8;
static constexpr std::size_t CipherUnitBytes = 2 * PrimeBits / 8;

// tuple of all keys
template<typename... BIGUINTS>
void readKeys(const char* keyfile, BIGUINTS&... args);

std::size_t fileSize(std::FILE* fp);

void encrypt(const char* src, const char* dst, const char* keyFile);
void decrypt(const char* src, const char* dst, const char* keyFile);

template<std::size_t CipherChunkBits>
BigUInt<CipherChunkBits> decryptUsingChineseRemainderTheorem_par(
    BigUInt<CipherChunkBits> const& cipher, BigUInt<CipherChunkBits> const& d,
    BigUInt<CipherChunkBits> const& n, BigUInt<CipherChunkBits/2> const& p,
    BigUInt<CipherChunkBits/2> const& q, BigUInt<CipherChunkBits/2> const& pInv,
    BigUInt<CipherChunkBits/2> const& qInv);

int main(int argc, char* argv[])
{
    if (argc != 5) {
	fmt::print(stderr, "usage: {}2.0 [-e/-d] <key> <file> <result>\n", argv[0]);
	std::exit(1);
    }
    const char* keyfile = argv[2];
    const char* src = argv[3];
    const char* dst = argv[4];   

    if (std::strcmp(argv[1], "-e") == 0) {
	encrypt(src, dst, argv[2]);
    } else if (std::strcmp(argv[1], "-d") == 0) {
	decrypt(src, dst, argv[2]);
    } else {
	fmt::print(stderr, "unknown option {}\n", argv[1]);
	std::exit(1);
    }
}

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

	auto encrypted = modularExp(plainBuff, e, n);
	if (std::fwrite(encrypted.data().data(), 1, CipherUnitBytes, fpdst) != CipherUnitBytes) {
	    std::fprintf(stderr, "fwrite error\n");
	    std::exit(2);
	}
    }

    std::fclose(fpsrc);
    std::fclose(fpdst);
}

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
		= decryptUsingChineseRemainderTheorem_par(cipherBuff, d, n, p, q, pInv, qInv);
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
    BigUInt<CipherChunkBits/2> const& qInv)
{
    std::future<BigUInt<CipherChunkBits/2>>
	fut1 = std::async([&](){
			      auto cipher1 = modLess(cipher, p);
			      auto d1 = modLess(d, p - 1);
			      return modularExp(cipher1, d1, p);
			  }),
	fut2 = std::async([&](){
			      auto cipher2 = modLess(cipher, q);
			      auto d2 = modLess(d, q - 1);
			      return modularExp(cipher2, d2, q);			  
			  });

    auto m1 = fut1.get();
    auto m2 = fut2.get();

    auto exN = n.template resize<CipherChunkBits*2>();
    auto m = fullMultiply(fullMultiply(m1, q), qInv.template resize<CipherChunkBits>())
	+ fullMultiply(fullMultiply(m2, p), pInv.template resize<CipherChunkBits>());
    m = m % exN;
    return m.template resize<CipherChunkBits>();
}
