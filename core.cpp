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

void encryptFile_aes128_CBC(std::istream& src, std::ostream& dst, uint8_t* key)
{
    __m128i keySchedule[20];
    detail::loadKey_aes128(key, keySchedule);
    
    constexpr std::size_t BlockSize = 128/8; // 16
    std::size_t nread = 0;
    std::array<uint8_t, BlockSize> prev;
    std::array<uint8_t, BlockSize> curr = {0};
    // generate initialization vector
    util::randomGenBytes(prev.begin(), prev.end());
    // write iv
    if (dst.write((char*)&prev[0], BlockSize); !dst) {
        std::perror("ostream::write error");
        std::exit(4);
    }
    bool quit = false;
    while (!quit) {
        std::fill(curr.begin(), curr.end(), 0);
        nread = src.read((char*)&curr[0], BlockSize).gcount();
        if (nread < BlockSize) {
            if (src.eof()) {
                // do padding
                uint8_t pad = BlockSize - nread;
                for (std::size_t i = nread; i < BlockSize; ++i)
                    curr[i] = pad;
                quit = true;
            } else {
                std::perror("istream::read error");
                std::exit(3);
            }
        }
        
        // do CBC xor
        std::transform(curr.begin(), curr.end(), prev.begin(), curr.begin(),
                       [](uint8_t a, uint8_t b) { return a ^ b; });

        // encrypt
        detail::encryptBlock_aes128(&curr[0], &prev[0], keySchedule);
        dst.write((char*)&prev[0], BlockSize);
        // if (!dst.good()) {
        //     std::perror("ostream::write error");
        //     std::exit(4);
        // }
    }
}


void decryptFile_aes128_CBC(std::istream& src, std::ostream& dst, uint8_t* key)
{
    __m128i keySchedule[20];
    detail::loadKey_aes128(key, keySchedule);
    constexpr std::size_t BlockSize = 128/8; // 16

    std::array<uint8_t, BlockSize> iv;
    std::array<uint8_t, BlockSize> cipher;
    // read iv
    if (src.read((char*)&iv[0], BlockSize).gcount() != BlockSize) {
        fmt::print(stderr, "invalid aes file format (no iv)\n");
        std::exit(5);
    }

    while (1) {
        if (std::size_t nread = src.read((char*)&cipher[0], BlockSize).gcount();
            nread != BlockSize) {
            if (src.eof()) {
                fmt::print(stderr, "invalid aes file format\n");
                std::exit(7);
            } else {
                std::perror("istream::read error");
                std::exit(6);
            }
        }

        bool isLast = util::noMoreData(src);

        std::array<uint8_t, BlockSize> plain;
        detail::decryptBlock_aes128(&cipher[0], &plain[0], keySchedule);

        // do aes xor
        std::transform(plain.begin(), plain.end(), iv.begin(), plain.begin(),
                       [](uint8_t a, uint8_t b) { return a ^ b; });
        iv = cipher;
        if (isLast) {
            uint8_t pad = plain[BlockSize - 1];
            std::size_t nvalid = BlockSize - pad;
            if (nvalid > 0) {                
                for (std::size_t i = nvalid; i < BlockSize; ++i) {
                    if (plain[i] != pad) {
                        fmt::print(stderr, "invalid aes pad format\n");
                        std::exit(8);
                    }
                    plain[i] = 0;
                }
                dst.write((char*)&plain[0], nvalid); 
                // if (!dst.good()) {
                //     std::perror("ostream::write error");
                //     std::exit(7);
                // }
            } // else it's a empty block
            break;
        } else {
            dst.write((char*)&plain[0], BlockSize); 
            // if (!dst.good()) {
            //     std::perror("ostream::write error");
            //     std::exit(7);
            // }
        }
    }
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
