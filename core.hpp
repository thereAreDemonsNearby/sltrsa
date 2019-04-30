#include <fmt/format.h>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <utility>
#include <cstring>
#include <future>
#include <string>
#include <vector>
#include "ntalgo.hpp"
#include "TimerGuard.h"
#include "MontMul_alter.hpp"

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
    BigUInt<KeyBits/2> d1;
    BigUInt<KeyBits/2> d2;
};

inline bool noMoreData(std::FILE* fp)
{
    int ch = std::getc(fp);
    if (ch == EOF) {
        return true;
    } else {
        std::ungetc(ch, fp);
        return false;
    }
}

namespace sha
{
std::vector<uint8_t> digest_sha256(std::FILE* src);
}

namespace rsa
{
template<std::size_t KeyBits>
std::vector<std::byte> encryptBlock(std::vector<std::byte>&);

template<std::size_t KeyBits>
void encryptFile(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key, int threadNum = 1);
template<std::size_t KeyBits>
void encryptFile_serial(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key);
template<std::size_t KeyBits>
void encryptFile_par(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key, int threadNum);

template<std::size_t KeyBits>
void decryptFile(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key, int threadNum = 1);
template<std::size_t KeyBits>
void decryptFile_serial(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key);
template<std::size_t KeyBits>
void decryptFile_par(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key, int threadNum);

template<std::size_t KeyBits>
BigUInt<KeyBits> decryptUsingChineseRemainderTheorem(
    BigUInt<KeyBits> const& cipher, PrivateKey<KeyBits> const& key,
    GNKCtx<KeyBits/2> const& pContext,
    GNKCtx<KeyBits/2> const& qContext,
    bool par = false);

}


namespace rsa
{
template<std::size_t KeyBits>
void encryptFile(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key, int threadNum)
{
    if (threadNum > 1) {
        encryptFile_par(src, dst, key, threadNum);
    } else {
        encryptFile_serial(src, dst, key);
    }
}

template<std::size_t KeyBits>
void encryptFile_serial(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key)
{
    // const std::size_t PlainBlockBytes = (KeyBits - 32) / 8;
    const std::size_t CipherBlockBytes = KeyBits / 8;
    const std::size_t PlainBlockBytes = CipherBlockBytes - 1;
    ContextOfMontgomery<KeyBits> context(key.n);    
    
    std::size_t nread;
    bool quit = false;
    BigUInt<CipherBlockBytes * 8> plainBuff;
    while (!quit) {
	plainBuff = 0;
	nread = std::fread(plainBuff.data().data(), 1, PlainBlockBytes, src);
	if (nread < PlainBlockBytes) {
            // end of file
	    if (std::ferror(src)) {
		std::fprintf(stderr, "fread error\n");
		std::exit(2);
	    } else {
                // do padding
                uint8_t nSpareBytes = static_cast<uint8_t>(PlainBlockBytes - nread);
                uint8_t* plainBuffPtr = reinterpret_cast<uint8_t*>(plainBuff.data().data());
                for (std::size_t i = 0; i < nSpareBytes; ++i) {
                    plainBuffPtr[nread + i] = nSpareBytes;
                }
                quit = true;
	    }
	}

	auto encrypted = modularExp_montgomery(plainBuff, key.e, key.n, context);
	if (std::fwrite(encrypted.data().data(), 1, CipherBlockBytes, dst) != CipherBlockBytes) {
	    std::fprintf(stderr, "fwrite error\n");
	    std::exit(2);
	}
    }

    std::fclose(src);
    std::fclose(dst);
}


template<std::size_t KeyBits>
void encryptFile_par(std::FILE* src, std::FILE* dst, PublicKey<KeyBits> const& key, int threadNum)
{
    //const std::size_t PlainBlockBytes = (KeyBits - 32) / 8;
    const std::size_t CipherBlockBytes = KeyBits / 8;
    const std::size_t PlainBlockBytes = CipherBlockBytes - 1;
    ContextOfMontgomery<KeyBits> context(key.n);    
    
    std::size_t nread;
    std::size_t nbuf = 0;
    std::vector<BigUInt<KeyBits>> buffers(threadNum);
    bool quit = false;
    while (!quit) {
        nbuf = 0;
        for (std::size_t i = 0; i < threadNum; ++i) {
            buffers[i] = 0;
            nread = std::fread(buffers[i].data().data(), 1, PlainBlockBytes, src);
            nbuf += 1;
            if (nread < PlainBlockBytes) {
                if (std::ferror(src)) {
                    std::perror("fread error");
                    std::exit(8);
                } else {
                    uint8_t nSpareBytes = static_cast<uint8_t>(PlainBlockBytes - nread);
                    uint8_t* bufPtr = reinterpret_cast<uint8_t*>(buffers[i].data().data());
                    for (std::size_t i = 0; i < nSpareBytes; ++i) {
                        bufPtr[nread + i] = nSpareBytes;
                    }
                    quit = true;
                    break;
                }
            }
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
            if (std::fwrite(futs[i].get().data().data(), 1, CipherBlockBytes, dst)
                != CipherBlockBytes) {
                std::perror("fwrite error");
                std::exit(9);
            }
        }
    }

    std::fclose(src);
    std::fclose(dst);
}

template<std::size_t KeyBits>
void decryptFile(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key, int threadNum)
{
    if (threadNum > 1) {
        decrypt_par(src, dst, key, threadNum);
    } else {
        decrypt_serial(src, dst, key);
    }
}

template<std::size_t KeyBits>
void decryptFile_serial(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key)
{
    // const std::size_t PlainBlockBytes = (KeyBits - 32) / 8;
    const std::size_t CipherBlockBytes = KeyBits / 8;
    const std::size_t PlainBlockBytes = CipherBlockBytes - 1;
    // ContextOfMontgomery<KeyBits/2> pContext(key.p);
    // ContextOfMontgomery<KeyBits/2> qContext(key.q);
    GNKCtx<KeyBits/2> pContext(key.p);
    GNKCtx<KeyBits/2> qContext(key.q);

    std::size_t nread;
    BigUInt<CipherBlockBytes * 8> cipherBuff;
//  TimerGuard tg("pure time:", TimerGuard::Delay{}, std::cerr);
    bool quit = false;
    if (noMoreData(src)) {
        std::fputs("no available data in input file", stderr);
    }
    while (!quit) {
	cipherBuff = 0;
	nread = std::fread(cipherBuff.data().data(), 1, CipherBlockBytes, src);
        if (nread < CipherBlockBytes) {
	    if (std::ferror(src)) {
		std::perror("fread error\n");
		std::exit(3);
	    } else {
                std::fprintf(stderr, "format error\n");
                std::exit(3);
	    }
	}
        

	std::size_t nwrite = PlainBlockBytes;
	BigUInt<CipherBlockBytes * 8> decrypted
	    = decryptUsingChineseRemainderTheorem(cipherBuff, key, pContext, qContext);
        if (noMoreData(src)) {
            // last block
            quit = true;
            uint8_t* p = reinterpret_cast<uint8_t*>(decrypted.data().data());
            uint8_t* last = p + (PlainBlockBytes - 1);
            uint8_t nSpare = *last;
            for (uint8_t i = 1; i <= nSpare; ++i, --last) {
                *last = 0;
            }
            nwrite -= nSpare;
        }

	if (std::fwrite(decrypted.data().data(), 1, nwrite, dst) != nwrite) {
	    std::perror("fwrite error\n");
	    std::exit(3);
	}
    }

    std::fclose(src);
    std::fclose(dst);
}

template<std::size_t KeyBits>
void decryptFile_par(std::FILE* src, std::FILE* dst, PrivateKey<KeyBits> const& key, int threadNum)
{
    // const std::size_t PlainBlockBytes = (KeyBits - 32) / 8;
    const std::size_t CipherBlockBytes = KeyBits / 8;
    const std::size_t PlainBlockBytes = CipherBlockBytes - 1;

    GNKCtx<KeyBits/2> pContext(key.p);
    GNKCtx<KeyBits/2> qContext(key.q);

    std::size_t nread;
    std::size_t nbuf;
    std::vector<BigUInt<KeyBits>> buffers(threadNum);
    // ctpl::thread_pool thrdpool(threadNum);
    if (noMoreData(src)) {
        std::fputs("no available data in input file", stderr);
    }
    bool quit = false;
    while (!quit) {
        nbuf = 0;
        for (int i = 0; i < buffers.size(); ++i) {
            buffers[i] = 0;
            nread = std::fread(buffers[i].data().data(), 1, CipherBlockBytes, src);
            if (nread < CipherBlockBytes) {
                if (std::ferror(src)) {
                    std::perror("fread error");
                    std::exit(10);
                } else {
                    if (nread == 0) {
                        break;
                    } else {
                        fmt::print(stderr, "format error");
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

        if (noMoreData(src)) {            
            quit = true;
            for (std::size_t i = 0; i < nbuf - 1; ++i) {
                std::size_t nwrite = PlainBlockBytes;
                if (std::fwrite(futs[i].get().data().data(), 1, nwrite, dst) != nwrite) {
                    std::perror("fwrite error");
                    std::exit(11);
                }
            }
            std::size_t nwrite = PlainBlockBytes;
            BigUInt<CipherBlockBytes> lastBlock = std::move(futs[nbuf-1].get());
            uint8_t* p = reinterpret_cast<uint8_t*>(lastBlock.data().data());
            uint8_t* lastByte = p + (PlainBlockBytes - 1);
            uint8_t nSpare = *lastByte;
            for (uint8_t i = 1; i <= nSpare; ++i, --lastByte) {
                *lastByte = 0;
            }
            nwrite -= nSpare;
            if (std::fwrite(lastBlock.data().data(), 1, nwrite, dst) != nwrite) {
                std::perror("fwrite error");
                std::exit(12);
            }                        
        } else {
            for (std::size_t i = 0; i < nbuf; ++i) {
                std::size_t nwrite = PlainBlockBytes;
                if (std::fwrite(futs[i].get().data().data(), 1, nwrite, dst) != nwrite) {
                    std::perror("fwrite error");
                    std::exit(11);
                }
            }
        }
    }

    std::fclose(src);
    std::fclose(dst);   
}

template<std::size_t KeyBits>
BigUInt<KeyBits> decryptUsingChineseRemainderTheorem(
    BigUInt<KeyBits> const& cipher, PrivateKey<KeyBits> const& key,
    GNKCtx<KeyBits/2> const& pContext,
    GNKCtx<KeyBits/2> const& qContext, bool par)
{
    // TimerGuard tg("chineseremainder all:");
    // TimerGuard tg2("chineseremainder pure:", TimerGuard::Delay{});
    if (par) {
        BigUInt<KeyBits/2> m1, m2;
        auto fut1 = std::async([&cipher, &key, &pContext, &m1](){
            auto cipher1 = modLess(cipher, key.p);          
            m1 = modularExp_GNK
                (cipher1, key.d1, key.p, pContext);
        });

        auto fut2 = std::async([&cipher, &key, &qContext, &m2](){
            auto cipher2 = modLess(cipher, key.q);
            m2 = modularExp_GNK
                (cipher2, key.d2, key.q, qContext);
        });
        fut1.wait();
        fut2.wait();
        auto m = fullMultiply_comba_simd(fullMultiply_comba_simd(m1, key.q), key.qInv.template resize<KeyBits>())
            + fullMultiply_comba_simd(fullMultiply_comba_simd(m2, key.p), key.pInv.template resize<KeyBits>());
        return modLess(m, key.n);
    } else {
        auto cipher1 = modLess(cipher, key.p);
        auto m1 = modularExp_GNK(cipher1, key.d1, key.p, pContext);
        auto cipher2 = modLess(cipher, key.q);
        // fmt::print("1s in d1: {0}\n1s in d2: {1}\n", count1(d1), count1(d2));
        auto m2 = modularExp_GNK(cipher2, key.d2, key.q, qContext);
        auto m = fullMultiply(fullMultiply(m1, key.q), key.qInv.template resize<KeyBits>())
            + fullMultiply(fullMultiply(m2, key.p), key.pInv.template resize<KeyBits>());
        return modLess(m, key.n);
    }
}

} // namespace rsa

namespace sha
{
namespace detail
{

uint32_t rightRotate(uint32_t v, std::size_t s)
{
    return (v << (32 - s)) & (v >> s);
}

// byte chunk[64], uint32_t hash[8], uint32_t k[64]
void processChunk_sha256(uint8_t chunk[], uint32_t hash[], uint32_t k[])
{
    uint32_t w[64] = {0};
    memcpy(w, chunk, 64); // 64 bytes in first 16 elements of w
    for (std::size_t i = 16; i < 64; ++i) {
        uint32_t s0 = rightRotate(w[i-15], 7) ^ rightRotate(w[i-15], 18) ^ (w[i-15] >> 3);
        uint32_t s1 = rightRotate(w[i-2], 17) ^ rightRotate(w[i-2], 19) ^ (w[i-2] >> 10);
        w[i] = w[i-16] + s0 + w[i-7] + s1;
    }
    uint32_t a = hash[0], b = hash[1], c = hash[2], d = hash[3],
        e = hash[4], f = hash[5], g = hash[6], h = hash[7];
    for (std::size_t i = 0; i < 64; ++i) {
        uint32_t s1 = rightRotate(e, 6) ^ rightRotate(e, 11) ^ rightRotate(e, 25);
        uint32_t ch = (e & f) ^ ((~e) & g);
        uint32_t temp1 = h + s1 + ch + k[i] + w[i];
        uint32_t s0 = rightRotate(a, 2) ^ rightRotate(a, 13) ^ rightRotate(a, 22);
        uint32_t maj = (a & b) ^ (a & c) ^ (b & c);
        uint32_t temp2 = s0 + maj;

        h = g;
        g = f;
        f = e;
        e = d + temp1;
        d = c;
        c = b;
        b = a;
        a = temp1 + temp2;
    }
    hash[0] += a;
    hash[1] += b;
    hash[2] += c;
    hash[3] += d;
    hash[4] += e;
    hash[5] += f;
    hash[6] += g;
    hash[7] += h;
}
}

std::vector<uint8_t> digest_sha256(std::FILE* src)
{
    uint32_t h[8] = {
        0x6a09e667
        0xbb67ae85,
        0x3c6ef372,
        0xa54ff53a,
        0x510e527f,
        0x9b05688c,
        0x1f83d9ab,
        0x5be0cd19,
    };
    uint32_t k[64] = {
        0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
        0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
        0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
        0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
        0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
        0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
        0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
    };

    // 512 bit chunk
    constexpr std::size_t ChunkSize = 512/8;
    uint8_t chunk[ChunkSize];
    uint64_t totalSize = 0;
    while (true) {
        std::size_t nread = 0;
        nread = std::fread(chunk, 1, ChunkSize, src);
        totalSize += nread;
        if (nread < ChunkSize) {
            // last chunk
            chunk[]
            if (ChunkSize - nread > 8) {
                // enough space for padding
                
            }
            break;
        } else {
            // whole chunk
        }
    }        
}

} // namespace sha
