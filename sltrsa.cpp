#include <fmt/format.h>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <utility>
#include <cstring>
#include <future>
#include <filesystem>
#include <string>
#include <vector>
#include "ntalgo.hpp"
#include "TimerGuard.h"
#include "ctpl.h"

namespace fs = std::filesystem;

template<std::size_t KeyBits>
struct PublicKey
{
    BigUInt<KeyBits> e;
    BigUInt<KeyBits> n;
};

template<std::size_t KeyBits>
struct PrivateKey
{
    BigUInt<KeyBits> d;
    BigUInt<KeyBits> n;
    BigUInt<KeyBits/2> p;
    BigUInt<KeyBits/2> q;
    BigUInt<KeyBits/2> pInv;
    BigUInt<KeyBits/2> qInv;
};

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

static std::size_t fileSize(std::FILE* fp)
{
    auto curr = std::ftell(fp);
    std::fseek(fp, 0, SEEK_END);
    auto size = std::ftell(fp);
    std::fseek(fp, curr, SEEK_SET);

    return size;
}

template<std::size_t KeyBits>
void encrypt(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key);
template<std::size_t KeyBits>
void encrypt_serial(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key);
template<std::size_t KeyBits>
void encrypt_par(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key);

template<std::size_t KeyBits>
void decrypt(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key);
template<std::size_t KeyBits>
void decrypt_serial(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key);
template<std::size_t KeyBits>
void decrypt_par(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key);

template<std::size_t KeyBits>
BigUInt<KeyBits> decryptUsingChineseRemainderTheorem(
    BigUInt<KeyBits> const& cipher, PrivateKey<KeyBits> const& key,
    ContextOfMontgomery<KeyBits/2> const& pContext,
    ContextOfMontgomery<KeyBits/2> const& qContext);


template<std::size_t KeyBits>
PublicKey<KeyBits> readPublicKey(std::ifstream& ifs)
{
    PublicKey<KeyBits> pk;
    std::string buf;
    std::getline(ifs, buf);
    std::getline(ifs, buf);
    pk.e = BigUInt<KeyBits>::fromDec(buf);
    std::getline(ifs, buf);
    std::getline(ifs, buf);
    pk.n = BigUInt<KeyBits>::fromDec(buf);
    return pk;
}

template<std::size_t KeyBits>
PrivateKey<KeyBits> readPrivateKey(std::ifstream& ifs)
{
    PrivateKey<KeyBits> pk;
    std::string buf;
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.d = BigUInt<KeyBits>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.n = BigUInt<KeyBits>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.p = BigUInt<KeyBits/2>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.q = BigUInt<KeyBits/2>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.pInv = BigUInt<KeyBits/2>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.qInv = BigUInt<KeyBits/2>::fromDec(buf);
    return pk;
}

static bool parallel = false;
static int threadNum = 1;

int main(int argc, char* argv[])
{
    std::ifstream keyFile;
    char const* keyFileName;
    std::FILE* src;
    std::FILE* dst;
    std::size_t srcSize;
    
    std::size_t idx = 1;
    if (idx < argc && std::strcmp(argv[idx], "--help") == 0) {
        fmt::print(stderr, "{} [-p threadNum] <key> [src] [dest]\n", argv[0]);
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
        keyFileName = argv[idx];
        keyFile.open(argv[idx], std::ios::in);
        if (!keyFile.is_open()) {
            std::string msg = fmt::format("cannot open key file {}", argv[idx]);
            std::perror(msg.c_str());
            std::exit(2);
        }
        ++idx;
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
            if ((dst = std::fopen(argv[idx], "wb")) == NULL) {
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
            dst = stdout;
        }
    } else {
        src = stdin;
        dst = stdout;
    }

    std::size_t keyBits;
    std::string line;
    if (std::getline(keyFile, line)) {
        if (line.substr(0, 11) == "----SLTRSA-") {
            keyBits = std::stoul(line.substr(11));
        } else {
            fmt::print(stderr, "{} is not a valid key file\n", keyFileName);
            std::exit(6);
        }
    } else {
        fmt::print(stderr, "{} is not a valid key file\n", keyFileName);
        std::exit(6);
    }

    std::getline(keyFile, line);
    if (line == "----PublicKey----") {
        if (keyBits == 1024) {
            auto pk = readPublicKey<1024>(keyFile);
            encrypt<1024>(src, dst, pk);
        } else if (keyBits == 2048) {
            auto pk = readPublicKey<2048>(keyFile);
            encrypt<2048>(src, dst, pk);
        } else {
            assert(keyBits == 4096);
            auto pk = readPublicKey<4096>(keyFile);
            encrypt<4096>(src, dst, pk);
        }
    } else if (line == "----PrivateKey----") {
        if (keyBits == 1024) {
            auto pk = readPrivateKey<1024>(keyFile);
            decrypt<1024>(src, dst, pk);
        } else if (keyBits == 2048) {
            auto pk = readPrivateKey<2048>(keyFile);
            decrypt<2048>(src, dst, pk);
        } else {
            assert(keyBits == 4096);
            auto pk = readPrivateKey<4096>(keyFile);
            decrypt<4096>(src, dst, pk);
        }
    } else {
        fmt::print(stderr, "Unknown key type\n");
        std::exit(7);
    }
}

template<std::size_t KeyBits>
void encrypt(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key)
{
    if (parallel) {
        encrypt_par(src, dst, key);
    } else {
        encrypt_serial(src, dst, key);
    }
}

template<std::size_t KeyBits>
void encrypt_serial(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key)
{
    const std::size_t PlainUnitBytes = (KeyBits - 32) / 8;
    const std::size_t CipherUnitBytes = KeyBits / 8;
    ContextOfMontgomery<KeyBits> context(key.n);
    
    std::size_t srcsz = fileSize(src);
    std::fwrite(&srcsz, sizeof(srcsz), 1, dst);
    
    std::size_t nread;
    BigUInt<CipherUnitBytes * 8> plainBuff;
    for (;;) {
	plainBuff = 0;
	nread = std::fread(plainBuff.data().data(), 1, PlainUnitBytes, src);
	if (nread < PlainUnitBytes) {
	    if (std::ferror(src)) {
		std::fprintf(stderr, "fread error\n");
		std::exit(2);
	    } else {
		if (nread == 0)
		    break;
	    }
	}

	auto encrypted = modularExp_montgomery(plainBuff, key.e, key.n, context);
	if (std::fwrite(encrypted.data().data(), 1, CipherUnitBytes, dst) != CipherUnitBytes) {
	    std::fprintf(stderr, "fwrite error\n");
	    std::exit(2);
	}
    }

    std::fclose(src);
    std::fclose(dst);
}


template<std::size_t KeyBits>
void encrypt_par(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key)
{
    const std::size_t PlainUnitBytes = (KeyBits - 32) / 8;
    const std::size_t CipherUnitBytes = KeyBits / 8;
    ContextOfMontgomery<KeyBits> context(key.n);
    
    std::size_t srcsz = fileSize(src);
    std::fwrite(&srcsz, sizeof(srcsz), 1, dst);
    
    std::size_t nread;
    std::size_t nbuf = 0;
    std::vector<BigUInt<KeyBits>> buffers(threadNum);
    
    for (;;) {
        nbuf = 0;
        for (std::size_t i = 0; i < threadNum; ++i) {
            buffers[i] = 0;
            nread = std::fread(buffers[i].data().data(), 1, PlainUnitBytes, src);
            if (std::ferror(src)) {
                std::perror("fread error");
                std::exit(8);
            } else {
                if (nread == 0)
                    break;
            }
            nbuf += 1;
        }

        if (nbuf == 0) {
            break;
        }

        std::vector<std::future<BigUInt<KeyBits>>> futs(nbuf);        
        for (std::size_t i = 0; i < futs.size(); ++i) {
            futs[i] = std::async([i, &buffers, &key, &context](){
                return modularExp_montgomery<KeyBits, Multiplier_comba_simd>
                    (buffers[i], key.e, key.n, context);
            });
        }

        for (std::size_t i = 0; i < futs.size(); ++i) {
            if (std::fwrite(futs[i].get().data().data(), 1, CipherUnitBytes, dst)
                != CipherUnitBytes) {
                std::perror("fwrite error");
                std::exit(9);
            }
        }
    }

    std::fclose(src);
    std::fclose(dst);
}

template<std::size_t KeyBits>
void decrypt(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key)
{
    if (parallel) {
        decrypt_par(src, dst, key);
    } else {
        decrypt_serial(src, dst, key);
    }
}

template<std::size_t KeyBits>
void decrypt_serial(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key)
{
    const std::size_t PlainUnitBytes = (KeyBits - 32) / 8;
    const std::size_t CipherUnitBytes = KeyBits / 8;

    ContextOfMontgomery<KeyBits/2> pContext(key.p);
    ContextOfMontgomery<KeyBits/2> qContext(key.q);
    
    std::size_t dstsz;
    if (std::fread(&dstsz, sizeof(std::size_t), 1, src) != 1) {
	std::perror("cannot read the size of the original file");
	std::exit(3);
    }

    std::size_t nread;
    BigUInt<CipherUnitBytes * 8> cipherBuff;
//    TimerGuard tg("pure time:", TimerGuard::Delay{}, std::cerr);
    for (;;) {
	cipherBuff = 0;
	nread = std::fread(cipherBuff.data().data(), 1, CipherUnitBytes, src);
	if (nread < CipherUnitBytes) {
	    if (std::ferror(src)) {
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
	    = decryptUsingChineseRemainderTheorem(cipherBuff, key, pContext, qContext);

	if (std::fwrite(decrypted.data().data(), 1, nwrite, dst) != nwrite) {
	    std::fprintf(stderr, "fwrite error\n");
	    std::exit(3);
	}
    }

    std::fclose(src);
    std::fclose(dst);
}

template<std::size_t KeyBits>
void decrypt_par(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key)
{
    const std::size_t PlainUnitBytes = (KeyBits - 32) / 8;
    const std::size_t CipherUnitBytes = KeyBits / 8;

    ContextOfMontgomery<KeyBits/2> pContext(key.p);
    ContextOfMontgomery<KeyBits/2> qContext(key.q);

    std::size_t dstsz;
    if (std::fread(&dstsz, sizeof(std::size_t), 1, src) != 1) {
	std::perror("cannot read the size of the original file");
	std::exit(3);
    }

    std::size_t nread;
    std::size_t nbuf;
    std::vector<BigUInt<KeyBits>> buffers(threadNum - 2);
    // ctpl::thread_pool thrdpool(threadNum);
    for (;;) {
        nbuf = 0;
        for (int i = 0; i < threadNum - 2; ++i) {
            buffers[i] = 0;
            nread = std::fread(buffers[i].data().data(), 1, CipherUnitBytes, src);
            if (nread < CipherUnitBytes) {
                if (std::ferror(src)) {
                    std::perror("fread error");
                    std::exit(10);
                } else {
                    if (nread == 0) {
                        break;
                    } else {
                        fmt::print(stderr, "format error(incomplete file)\n");
                        std::exit(10);
                    }
                }
            }
            ++nbuf;
        }

        if (nbuf == 0)
            break;

        std::vector<std::future<BigUInt<KeyBits>>> futs(nbuf);
        for (std::size_t i = 0; i < nbuf; ++i) {
            futs[i] = std::async([i, &buffers, &key, &pContext, &qContext](){
                return decryptUsingChineseRemainderTheorem(buffers[i], key, pContext, qContext);
            });
            // futs[i] = thrdpool.push([i, &buffers, &key, &pContext, &qContext, &thrdpool](int id){
            //     return decryptUsingChineseRemainderTheorem(buffers[i], key, pContext, qContext, &thrdpool);
            // });
        }

        for (std::size_t i = 0; i < nbuf; ++i) {
            std::size_t nwrite = dstsz >= PlainUnitBytes ? PlainUnitBytes : dstsz;
            dstsz -= nwrite;
            if (std::fwrite(futs[i].get().data().data(), 1, nwrite, dst) != nwrite) {
                std::perror("fwrite error");
                std::exit(11);
            }
        }
    }

    std::fclose(src);
    std::fclose(dst);   
}

template<std::size_t KeyBits>
BigUInt<KeyBits> decryptUsingChineseRemainderTheorem(
    BigUInt<KeyBits> const& cipher, PrivateKey<KeyBits> const& key,
    ContextOfMontgomery<KeyBits/2> const& pContext,
    ContextOfMontgomery<KeyBits/2> const& qContext)
{
    // TimerGuard tg("chineseremainder all:");
    // TimerGuard tg2("chineseremainder pure:", TimerGuard::Delay{});
    if (parallel) {
        BigUInt<KeyBits/2> m1, m2;
        auto fut1 = std::async([&cipher, &key, &pContext, &m1](){
            auto cipher1 = modLess(cipher, key.p);
            auto d1 = modLess(key.d, key.p - 1);
            m1 = modularExp_montgomery<KeyBits/2, Multiplier_comba_simd>
                (cipher1, d1, key.p, pContext);
        });

        auto fut2 = std::async([&cipher, &key, &qContext, &m2](){
            auto cipher2 = modLess(cipher, key.q);
            auto d2 = modLess(key.d, key.q - 1);
            m2 = modularExp_montgomery<KeyBits/2, Multiplier_comba_simd>
                (cipher2, d2, key.q, qContext);
        });
        fut1.wait();
        fut2.wait();
        auto m = fullMultiply_comba_simd(fullMultiply_comba_simd(m1, key.q), key.qInv.template resize<KeyBits>())
            + fullMultiply_comba_simd(fullMultiply_comba_simd(m2, key.p), key.pInv.template resize<KeyBits>());
        return modLess(m, key.n);
    } else {
        auto cipher1 = modLess(cipher, key.p);
        auto d1 = modLess(key.d, key.p - 1);
        auto m1 = modularExp_montgomery(cipher1, d1, key.p, pContext);
        auto cipher2 = modLess(cipher, key.q);
        auto d2 = modLess(key.d, key.q - 1);
        // fmt::print("1s in d1: {0}\n1s in d2: {1}\n", count1(d1), count1(d2));
        auto m2 = modularExp_montgomery(cipher2, d2, key.q, qContext);
        auto m = fullMultiply(fullMultiply(m1, key.q), key.qInv.template resize<KeyBits>())
            + fullMultiply(fullMultiply(m2, key.p), key.pInv.template resize<KeyBits>());
        return modLess(m, key.n);
    }
}
