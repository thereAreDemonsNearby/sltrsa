#include "core.hpp"
#include <x86intrin.h>

namespace sha
{
namespace detail
{

uint32_t rightRotate(uint32_t v, std::size_t s)
{
    return (v << (32 - s)) | (v >> s);
}

// byte chunk[64], uint32_t hash[8], uint32_t k[64]
void processChunk_sha256(uint8_t chunk[], uint32_t hash[], uint32_t k[])
{
    uint32_t w[64] = {0};
    //memcpy(w, chunk, 64); // 64 bytes in first 16 elements of w
    for (std::size_t i = 0; i < 16; ++i) {
        // big endian
        w[i] = (uint32_t(chunk[4*i]) << 24) | (uint32_t(chunk[4*i+1]) << 16)
            | (uint32_t(chunk[4*i+2]) << 8) | (uint32_t(chunk[4*i+3]));
        // fmt::print("w[{0}]={1:08x}\n", i, w[i]);
    }
    for (std::size_t i = 16; i < 64; ++i) {
        uint32_t s0 = rightRotate(w[i-15], 7) ^ rightRotate(w[i-15], 18) ^ (w[i-15] >> 3);
        uint32_t s1 = rightRotate(w[i-2], 17) ^ rightRotate(w[i-2], 19) ^ (w[i-2] >> 10);
        w[i] = w[i-16] + s0 + w[i-7] + s1;
        // fmt::print("w[{0}]={1:08x}\n", i, w[i]);
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
} // end namespace sha::detail

std::vector<uint8_t> fileDigest_sha256(std::FILE* src)
{
    uint32_t h[8] = {
        0x6a09e667,
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
        // init chunk
        for (std::size_t i = 0; i < ChunkSize; ++i)
            chunk[i] = 0;
        
        nread = std::fread(chunk, 1, ChunkSize, src);
        totalSize += nread;
        if (nread < ChunkSize) {
            // last chunk
            chunk[nread] = 0x80;
            totalSize *= 8; // count in bits
            if (ChunkSize - nread > 8) {
                // enough space for padding
                // big endian
                for (std::size_t i = 1; i <= 8; ++i) {
                    chunk[ChunkSize - i] = uint8_t(totalSize);
                    totalSize >>= 8;
                }
                // for (std::size_t i = 0; i < ChunkSize; ++i)
                //     fmt::print("{0:02x}", chunk[i]);
                // fmt::print("\n");
                detail::processChunk_sha256(chunk, h, k);
            } else {
                // not enough space for padding. one more chunk.
                detail::processChunk_sha256(chunk, h, k);
                uint8_t extraChunk[ChunkSize] = {0};
                for (std::size_t i = 1; i <= 8; ++i) {
                    chunk[ChunkSize - i] = uint8_t(totalSize);
                    totalSize >>= 8;
                }
                detail::processChunk_sha256(extraChunk, h, k);
            }
            break;
        } else {
            // whole chunk
            detail::processChunk_sha256(chunk, h, k);
        }
    }

    std::vector<uint8_t> digest(32, 0);
    for (std::size_t i = 0; i < 8; ++i) {
        // big endian
        digest[4*i] = uint8_t(h[i] >> 24);
        digest[4*i+1] = uint8_t(h[i] >> 16);
        digest[4*i+2] = uint8_t(h[i] >> 8);
        digest[4*i+3] = uint8_t(h[i]);
    }
    return digest;
}

} // namespace sha

namespace aes
{

namespace detail
{

#define keyExpansion_aes128(key, roundConstant) keyExpansion_aes128_impl \
    (key, _mm_aeskeygenassist_si128(key, roundConstant))

__m128i keyExpansion_aes128_impl(__m128i key, __m128i keyGened)
{
    keyGened = _mm_shuffle_epi32(keyGened, _MM_SHUFFLE(3, 3, 3, 3));
    key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
    key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
    key = _mm_xor_si128(key, _mm_slli_si128(key, 4));
    return _mm_xor_si128(key, keyGened);
}

// generate round keys using key
// __m128i keySchedule[20]; uint8_t key[16];
void loadKey_aes128(uint8_t* key, __m128i* keySchedule)
{
    keySchedule[0] = _mm_load_si128(reinterpret_cast<__m128i*>(key));
    // gen key for enc
    // int rc = 1;
    // for (std::size_t i = 1; i <= 10; ++i) {
    //     keySchedule[i] = keyExpansion_aes128(keySchedule[i-1], rc);
    //     rc *= 2;
    // }
    keySchedule[1] = keyExpansion_aes128(keySchedule[0], 1);
    keySchedule[2] = keyExpansion_aes128(keySchedule[1], 2);
    keySchedule[3] = keyExpansion_aes128(keySchedule[2], 4);
    keySchedule[4] = keyExpansion_aes128(keySchedule[3], 8);
    keySchedule[5] = keyExpansion_aes128(keySchedule[4], 16);
    keySchedule[6] = keyExpansion_aes128(keySchedule[5], 32);
    keySchedule[7] = keyExpansion_aes128(keySchedule[6], 64);
    keySchedule[8] = keyExpansion_aes128(keySchedule[7], 128);
    keySchedule[9] = keyExpansion_aes128(keySchedule[8], 0x1b);
    keySchedule[10] = keyExpansion_aes128(keySchedule[9], 0x36);

    // gen key for dec
    for (std::size_t i = 11, j = 9; i < 20; ++i, --j) {
        keySchedule[i] = _mm_aesimc_si128(keySchedule[j]);
    }
}

// uint8_t plain[16]; uint8_t cipher[16]; __m128i keySchedule[20];
void encryptBlock_aes128(uint8_t* plain, uint8_t* cipher, __m128i* keySchedule)
{
    __m128i m = _mm_loadu_si128(reinterpret_cast<__m128i const*>(plain));
    m = _mm_xor_si128(m, keySchedule[0]);
    for (std::size_t i = 1; i <= 9; ++i) {
        m = _mm_aesenc_si128(m, keySchedule[i]);
    }
    m = _mm_aesenclast_si128(m, keySchedule[10]);
    _mm_storeu_si128(reinterpret_cast<__m128i*>(cipher), m);
}

void decryptBlock_aes128(uint8_t* cipher, uint8_t* plain, __m128i* keySchedule)
{
    __m128i m = _mm_loadu_si128(reinterpret_cast<__m128i const*>(cipher));
    m = _mm_xor_si128(m, keySchedule[10]);
    for (std::size_t i = 11; i <= 19; ++i) {
        m = _mm_aesdec_si128(m, keySchedule[i]);
    }
    m = _mm_aesdeclast_si128(m, keySchedule[0]);
    _mm_storeu_si128(reinterpret_cast<__m128i*>(plain), m);
}

}

void encryptFile_aes128(std::FILE* src, std::FILE* dst, uint8_t* key)
{
    __m128i keySchedule[20];
    detail::loadKey_aes128(key, keySchedule);
    
    constexpr std::size_t BlockSize = 128/8; // 16
    std::size_t nread = 0;
    uint8_t block[BlockSize];
    bool quit = false;
    while (!quit) {
        std::fill(block, block+BlockSize, 0);
        nread = std::fread(block, 1, BlockSize, src);
        if (nread < BlockSize) {
            if (std::ferror(src)) {
                std::perror("fread error");
                std::exit(1);
            } else {
                // do padding
                uint8_t pad = BlockSize - nread;
                for (std::size_t i = nread; i < BlockSize; ++i)
                    block[i] = pad;
                quit = true;
            }
        }
        uint8_t encrypted[BlockSize];
        detail::encryptBlock_aes128(block, encrypted, keySchedule);
        if (std::fwrite(encrypted, 1, BlockSize, dst) != BlockSize) {
            std::perror("fwrite error");
            std::exit(2);
        }
    }
}

void decryptFile_aes128(std::FILE* src, std::FILE* dst, uint8_t* key)
{
    
}

void selfTest()
{
    uint8_t plain[]      = {0x32, 0x43, 0xf6, 0xa8, 0x88, 0x5a, 0x30, 0x8d, 0x31, 0x31, 0x98, 0xa2, 0xe0, 0x37, 0x07, 0x34};
    uint8_t enc_key[]    = {0x2c, 0x7e, 0x15, 0x16, 0x33, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c};
    uint8_t computed_cipher[16];
    uint8_t computed_plain[16];
    int out=0;
    __m128i key_schedule[20];
    detail::loadKey_aes128(enc_key,key_schedule);
    detail::encryptBlock_aes128(plain, computed_cipher, key_schedule);
    detail::decryptBlock_aes128(computed_cipher, computed_plain, key_schedule);
    if(memcmp(plain,computed_plain,sizeof(plain)))
        fmt::print(stderr, "error");
}

} // namespace aes
