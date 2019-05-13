#include <fmt/format.h>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <utility>
#include <cstring>
#include <future>
#include <string>
#include <vector>
#include <random>
#include <optional>
#include <boost/iostreams/device/array.hpp>
#include <boost/iostreams/stream.hpp>
#include <boost/archive/iterators/binary_from_base64.hpp>
#include <boost/archive/iterators/base64_from_binary.hpp>
#include <boost/archive/iterators/transform_width.hpp>
#include "ntalgo.hpp"
#include "primegen.hpp"
#include "TimerGuard.h"


namespace util
{
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

inline bool noMoreData(std::istream& is)
{
    if (is.peek() == std::istream::traits_type::eof())
        return true;
    else
        return false;
}

using MemStream = boost::iostreams::stream<
    boost::iostreams::basic_array_source<uint8_t>
    >;

template <typename U8Iter>
uint32_t bytesToU32BigEndian(U8Iter begin)
{
    return (uint32_t(begin[0]) << 24) | (uint32_t(begin[1]) << 16)
        | (uint32_t(begin[2]) << 8) | (uint32_t(begin[3]));
}

template <typename U8Iter>
void u32ToBytesBigEndian(uint32_t u32, U8Iter begin)
{
    begin[0] = (u32 >> 24) & 0xff;
    begin[1] = (u32 >> 16) & 0xff;
    begin[2] = (u32 >> 8) & 0xff;
    begin[3] = u32 & 0xff;
}

template <typename ByteIter>
void randomGenBytes(ByteIter begin, ByteIter end)
{
    std::random_device rd;
    std::mt19937 engine(rd());
    std::uniform_int_distribution<uint8_t> dist;
    for (; begin != end; ++begin) {
        *begin = dist(engine);
    }
}

} // end namespace util

namespace aes
{
// uint8_t key[16] 128/8=16
void encryptFile_aes128_CBC(std::istream& src, std::ostream& dst, uint8_t* key);
void decryptFile_aes128_CBC(std::istream& src, std::ostream& dst, uint8_t* key);
}

namespace sha
{
namespace detail
{
uint32_t rightRotate(uint32_t v, std::size_t s);
// byte chunk[64], uint32_t hash[8], uint32_t k[64]
void processChunk_sha256(uint8_t chunk[], uint32_t hash[], uint32_t k[]);
} // end namespace sha::detail

template <typename InputIterator, typename OutputIterator>
OutputIterator fileDigest_sha256(InputIterator begin, InputIterator end,
                       OutputIterator out)
{
    static_assert(sizeof *begin == 1, "must be byte iterator");
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
    constexpr std::size_t ChunkSize = 512/8; // 64 bytes
    uint8_t chunk[ChunkSize];
    uint64_t totalSize = 0;
    while (true) {
        // init chunk to 0's
        for (std::size_t i = 0; i < ChunkSize; ++i)
            chunk[i] = 0;

        // read one chunk
        std::size_t nread = 0;
        for (; begin != end && nread != ChunkSize; ++begin, ++nread) {
            chunk[nread] = *begin;
        }
        
        totalSize += nread;
        if (nread < ChunkSize) {
            // begin == end, last chunk 
            chunk[nread] = 0x80;
            totalSize *= 8; // count in bits
            if (ChunkSize - nread > 8) {
                // enough space for padding
                // big endian
                for (std::size_t i = 1; i <= 8; ++i) {
                    chunk[ChunkSize - i] = (uint8_t)totalSize;
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
            break; // time to quit loop
        } else {
            // whole chunk
            detail::processChunk_sha256(chunk, h, k);
        }
    }

    std::vector<uint8_t> digest(32, 0);
    for (std::size_t i = 0; i < 8; ++i) {
        // big endian
        *out++ = uint8_t(h[i] >> 24);
        *out++ = uint8_t(h[i] >> 16);
        *out++ = uint8_t(h[i] >> 8);
        *out++ = uint8_t(h[i]);
    }
    return out;
}

}

namespace util
{
template <typename InIter, typename OutIter>
void mgf1(InIter seedBegin, InIter seedEnd, OutIter maskBegin, OutIter maskEnd)
{
    // use sha256 as the optional hash function
    // sha256 generates 256bit(32byte) output
    std::size_t len = maskEnd - maskBegin;
    constexpr std::size_t hashLen = 32;
    std::vector<uint8_t> mask; // the result mask
    uint8_t hash[hashLen];
    std::size_t limit = (len + hashLen-1) / hashLen; // ceil(len/hashLen)
    std::vector<uint8_t> toBeHashed(seedEnd-seedBegin+4);
    std::copy(seedBegin, seedEnd, toBeHashed.begin());

    uint32_t counter;
    for (counter = 0; counter < limit - 1; ++counter) {
        // seed || counter
        u32ToBytesBigEndian(counter, toBeHashed.end() - 4);        
        sha::fileDigest_sha256(toBeHashed.begin(), toBeHashed.end(),
                               std::begin(hash));
        std::copy(std::begin(hash), std::end(hash), maskBegin);
        maskBegin += hashLen;
    }
    // treat the last loop separately
    u32ToBytesBigEndian(counter, toBeHashed.end() - 4);  
    sha::fileDigest_sha256(toBeHashed.begin(), toBeHashed.end(),
                           std::begin(hash));
    std::size_t restSz = maskEnd - maskBegin;
    std::copy(std::begin(hash), std::begin(hash) + restSz,
              maskBegin);
    maskBegin += restSz;
    assert(maskBegin == maskEnd);   
}

enum class Error
{
    LengthError,
    FormatError,
    LabelError,
    HashError,
    Ok,
};

static char const* errorToString[] = {"LengthError",
                                "FormatError", "LabelError",
                                "HashError", "Ok"};
// [begin, end) : original message
// [out, out+len) : the encoded message
template<typename InIter, typename OutIter>
Error OAEPEncode(InIter begin, InIter end,
                 OutIter out, std::size_t len)
{
    // use empty label
    // use sha256 as the optional hash function
    uint8_t emptyHash[] = {
        0xe3,0xb0,0xc4,0x42,0x98,0xfc,0x1c,0x14,
        0x9a,0xfb,0xf4,0xc8,0x99,0x6f,0xb9,0x24,
        0x27,0xae,0x41,0xe4,0x64,0x9b,0x93,0x4c,
        0xa4,0x95,0x99,0x1b,0x78,0x52,0xb8,0x55
    };
    std::size_t hashLen = 32;
    std::size_t msgLen = end - begin;
    if (msgLen > len - 2 * hashLen - 2) {
        return Error::LengthError;
    }
    // format:
    // [out, out+1) : 0x00
    // [out+1, out+1+hLen) : masked seed
    // [out+1+hLen, out+len) : masked db

    // inside db:
    // [out+1+hLen, out+1+2*hLen) : label hash
    // between hash and 0x01 : 0's
    // [out+len-mLen-1, out+len-mLen) : 0x01
    // [out+len-mLen, out+len) : message
    
    out[0] = 0x00;
    randomGenBytes(out+1, out+1+hashLen); // seed
    std::copy(std::begin(emptyHash), std::end(emptyHash),
              out+1+hashLen); // labelHash;
    out[len-msgLen-1] = 0x1;
    std::copy(begin, end, out+len-msgLen); // message
    std::fill(out+1+2*hashLen, out+len-msgLen-1, 0); // 0's

    // db to masked db
    std::vector<uint8_t> dbMask(len-hashLen-1);
    mgf1(out+1, out+1+hashLen, dbMask.begin(), dbMask.end());
    std::transform(dbMask.begin(), dbMask.end(),
                   out+1+hashLen, out+1+hashLen,
                   [](uint8_t a, uint8_t b){ return a ^ b; });

    // seed to masked seed
    std::vector<uint8_t> seedMask(hashLen);
    mgf1(out+1+hashLen, out+len, seedMask.begin(), seedMask.end());
    std::transform(seedMask.begin(), seedMask.end(),
                   out+1, out+1,
                   [](uint8_t a, uint8_t b){ return a ^ b; });
    // done
    return Error::Ok;
}


// return value: pair(bool, OutIter)
// stands for (valid format?, end iterator for output)
// [begin, end): encoded message
// [out, ...): the original message
template<typename InIter, typename OutIter>
std::pair<Error, OutIter> OAEPDecode(InIter begin, InIter end,
                                    OutIter out)
{
    uint8_t emptyHash[] = {
        0xe3,0xb0,0xc4,0x42,0x98,0xfc,0x1c,0x14,
        0x9a,0xfb,0xf4,0xc8,0x99,0x6f,0xb9,0x24,
        0x27,0xae,0x41,0xe4,0x64,0x9b,0x93,0x4c,
        0xa4,0x95,0x99,0x1b,0x78,0x52,0xb8,0x55
    };
    std::size_t hashLen = 32;
    std::size_t len = end - begin;

    // format:
    // [begin, begin+1) : 0x00
    // [begin+1, begin+1+hLen) : masked seed
    // [begin+1+hLen, begin+len) : masked db
    if (len < 2 * hashLen + 2) {
        return {Error::LengthError, out};
    }
    if (begin[0] != 0x00) {
        return {Error::FormatError, out};
    }

    // masked seed to seed:
    std::vector<uint8_t> seedMask(hashLen);
    mgf1(begin+1+hashLen, end, seedMask.begin(), seedMask.end());
    std::transform(seedMask.begin(), seedMask.end(),
                   begin+1, begin+1,
                   [](uint8_t a, uint8_t b){ return a ^ b; });
    // masked db to db:
    std::vector<uint8_t> dbMask(len-hashLen-1);
    mgf1(begin+1, begin+1+hashLen, dbMask.begin(), dbMask.end());
    std::transform(dbMask.begin(), dbMask.end(),
                   begin+1+hashLen, begin+1+hashLen,
                   [](uint8_t a, uint8_t b){ return a ^ b; });
    if (!std::equal(std::begin(emptyHash), std::end(emptyHash),
                   begin+1+hashLen, begin+1+2*hashLen)) {
        // label hash is wrong
        return {Error::LabelError, out};
    }
    
    auto it = begin+1+2*hashLen;
    for (;it != end && *it == 0x0; ++it) {
        ;
    }

    if (it == end || *it != 0x1) {
        return {Error::FormatError, out};
    }
    ++it; // skip 0x1

    // copy message to out
    out = std::copy(it, end, out);
    return {Error::Ok, out};
}

// input: hash of the original message
//        [hashBegin, hashEnd)
// output: pss encoded hash
//         [out, out+len)
template<typename InIter, typename OutIter>
Error PSSEncode(InIter hashBegin, InIter hashEnd,
               OutIter out, std::size_t len,
               std::size_t saltLen)
{
    // choose sha256 as the optional hash function
    constexpr std::size_t hashLen = 32;
    if (len < 2 + saltLen + hashLen) {
        return Error::LengthError;
    }

    // format:
    // [out, out+len-hashLen-1): masked db
    // [out+len-hashLen-1, out+len-1): H'
    // the last byte: 0xbc

    std::vector<uint8_t> toBeHashed(7+ hashLen + saltLen, 0);
    std::copy(hashBegin, hashEnd, toBeHashed.begin() + 7);
    // gen salt
    util::randomGenBytes(toBeHashed.begin() + 7 + hashLen,
                         toBeHashed.end());

    // fill db
    std::size_t padSz = len - hashLen - 1 - 1 - saltLen;
    auto it = out;
    std::fill(it, it+padSz, 0x0);
    it += padSz;
    *it++ = 0x1;
    it = std::copy(toBeHashed.begin()+7+hashLen, toBeHashed.end(), it);

    // the second hash
    it = sha::fileDigest_sha256(toBeHashed.begin(), toBeHashed.end(), it);

    // db -> masked db
    std::vector<uint8_t> dbMask(len - hashLen - 1);
    mgf1(it - hashLen, it, dbMask.begin(), dbMask.end());
    std::transform(dbMask.begin(), dbMask.end(), out, out,
                   [](uint8_t a, uint8_t b){ return a^b; });
    *it++ = 0xbc;
    *out &= 0x1f; // let the leading two bits be zero
    return Error::Ok;
}
// input: hash of the original message
// input: the PSS encoded hash digest
// verify.
// will destroy the content in [pssBegin, pssEnd)
template<typename HashIter, typename PSSIter>
Error PSSVerify(HashIter hashBegin, HashIter hashEnd,
                PSSIter pssBegin, PSSIter pssEnd)
{
    const std::size_t hashLen = 32; // sha256
    std::size_t len = pssEnd - pssBegin;
    if (pssBegin[len-1] != 0xbc) {
        return Error::FormatError;
    }

    std::vector<uint8_t> dbMask(len - 1 - hashLen);
    mgf1(pssBegin + len - hashLen - 1, pssBegin + len - 1,
         dbMask.begin(), dbMask.end());
    // recover db
    std::transform(dbMask.begin(), dbMask.end(),
                   pssBegin, pssBegin,
                   [](uint8_t a, uint8_t b){ return a^b; });
    *pssBegin &= 0x1f; // set the leading two bits to zero
    std::size_t saltLen;
    auto it = pssBegin;
    for (; it != pssBegin+len-hashLen-1 && *it == 0x0; ++it) {
        ;
    }
    if (it == pssBegin + len - hashLen - 1 || *it != 0x1) {
        return Error::FormatError;
    }
    ++it;
    auto saltBegin = it;
    auto saltEnd = pssBegin + len - hashLen - 1;
    saltLen = saltEnd - saltBegin;

    std::vector<uint8_t> toBeHashed(7+hashLen+saltLen, 0);
    auto it2 = std::copy(hashBegin, hashEnd, toBeHashed.begin()+7);
    std::copy(saltBegin, saltEnd, it2);
    std::vector<uint8_t> hash(hashLen);
    sha::fileDigest_sha256(toBeHashed.begin(), toBeHashed.end(), hash.begin());

    if (!std::equal(pssBegin+len-hashLen-1, pssBegin+len-1, hash.begin())) {
        return Error::HashError;
    }

    return Error::Ok;
}



template <typename OutIt>
std::pair<bool, OutIt> base64ToBinary(std::string const& base64, OutIt out)
{
    using namespace boost::archive::iterators;
    using DecIt = transform_width<binary_from_base64<const char*>, 8, 6>;
    auto size = base64.size();
    if (size && base64[size-1] == '=')
        --size;
    if (size && base64[size-1] == '=')
        --size;
    if (size == 0) {
        return {true, out};
    }

    try {
        auto end = std::copy(DecIt(base64.data()), DecIt(base64.data()+size),
                             out);
        return {true, end};
    } catch (...) {
        return {false, out};
    }
}

template<typename InIt>
std::string binaryToBase64(InIt begin, InIt end)
{
    using namespace boost::archive::iterators;
    using EncIt = base64_from_binary<transform_width<InIt, 6, 8>>;
    std::string ret;
    std::copy(EncIt(begin), EncIt(end), std::back_inserter(ret));
    while (ret.size() % 4 != 0)
        ret.push_back('=');
    return ret;
}


} // end namespace util

namespace rsa
{
// big endian conversion between integer and byte sequence
template<std::size_t B, typename ByteIter>
BigUInt<B> bytesToBigUInt(ByteIter begin, ByteIter end)
{
    while (begin != end && *begin == 0)
        ++begin;
    if (begin == end)
        return {}; // 0

    std::size_t byteCnt = end - begin;
    BigUInt<B> ret;
    std::size_t i = 0;
    while (begin <= end - 4) {
        ret[i++] = util::bytesToU32BigEndian(end - 4);
        end -= 4;
    }

    uint32_t last = 0;
    for (std::size_t shift = 0; begin < end; shift += 8, --end) {
        last |= uint32_t(*(end - 1)) << shift;
    }
    ret[i++] = last;

    return ret;
}

// reverses leading zero to protect encoding structure
template<std::size_t B, typename ByteIter>
ByteIter BigUIntToBytes(BigUInt<B> const& bi, ByteIter begin)
{
    int i = BigUInt<B>::VLEN - 1;   
    while (i >= 0) {
        uint8_t buf[4];
        util::u32ToBytesBigEndian(bi[i], buf);
        for (int j = 0; j < 4; ++j) {
            *begin++ = buf[j];
        }
        --i;
    }

    return begin;
}

template<std::size_t B, typename ByteIter>
ByteIter BigUIntToBytesTrim(BigUInt<B> const& bi, ByteIter begin)
{
    int i = BigUInt<B>::VLEN - 1;
    while (i >= 0 && bi[i] == 0)
        --i;
    if (i < 0) {
        *begin++ = 0;
        return begin;
    } else {
        uint8_t buf[4];
        util::u32ToBytesBigEndian(bi[i], buf);
        int j = 0;
        while (buf[j] == 0) ++j;
        while (j < 4) {
            *begin++ = buf[j];
            ++j;
        }
        --i;
    }
    while (i >= 0) {
        uint8_t buf[4];
        util::u32ToBytesBigEndian(bi[i], buf);
        for (int j = 0; j < 4; ++j) {
            *begin++ = buf[j];
        }
        --i;
    }
    return begin;
}

template<std::size_t KeyBits>
struct PublicKey
{
    BigUInt<KeyBits> n;
    BigUInt<KeyBits> e;
};

template<std::size_t KeyBits>
struct PrivateKey
{
    BigUInt<KeyBits> n;
    BigUInt<KeyBits> e;
    BigUInt<KeyBits> d;
    BigUInt<KeyBits/2> p;
    BigUInt<KeyBits/2> q;
    BigUInt<KeyBits/2> d1; // d mod (p-1)
    BigUInt<KeyBits/2> d2; // d mod (q-1)
    BigUInt<KeyBits/2> qInv; // q^(-1) mod p
};

struct KeyRaw
{
    enum KeyType {Public, Private};
    KeyType type;
    std::vector<std::vector<uint8_t>> numbers;
};

template<std::size_t KeyBits>
PublicKey<KeyBits> keyRawToPublicKey(KeyRaw const& raw)
{
    assert(raw.numbers[0].size() * 8 == KeyBits);
    PublicKey<KeyBits> key;
    key.n = bytesToBigUInt<KeyBits>(raw.numbers[0].begin(), raw.numbers[0].end());
    key.e = bytesToBigUInt<KeyBits>(raw.numbers[1].begin(), raw.numbers[1].end());
    return key;
}

template<std::size_t KeyBits>
PrivateKey<KeyBits> keyRawToPrivateKey(KeyRaw const& raw)
{
    assert(raw.numbers[0].size() * 8 == KeyBits);
    PrivateKey<KeyBits> key;
    key.n = bytesToBigUInt<KeyBits>(raw.numbers[0].begin(), raw.numbers[0].end());
    key.e = bytesToBigUInt<KeyBits>(raw.numbers[1].begin(), raw.numbers[1].end());
    key.d = bytesToBigUInt<KeyBits>(raw.numbers[2].begin(), raw.numbers[2].end());
    key.p = bytesToBigUInt<KeyBits>(raw.numbers[3].begin(), raw.numbers[3].end());
    key.q = bytesToBigUInt<KeyBits>(raw.numbers[4].begin(), raw.numbers[4].end());
    key.d1 = bytesToBigUInt<KeyBits>(raw.numbers[5].begin(), raw.numbers[5].end());
    key.d2 = bytesToBigUInt<KeyBits>(raw.numbers[6].begin(), raw.numbers[6].end());
    key.qInv = bytesToBigUInt<KeyBits>(raw.numbers[7].begin(), raw.numbers[7].end());
    return key;
}

template<std::size_t KeyBits>
BigUInt<KeyBits> decryptUsingChineseRemainderTheorem(
    BigUInt<KeyBits> const& cipher, PrivateKey<KeyBits> const& key,
    GNKCtx<KeyBits/2> const& pContext,
    GNKCtx<KeyBits/2> const& qContext,
    bool par = false);

template<std::size_t B, typename InIter, typename OutIter>
std::pair<util::Error, OutIter>
encrypt(PublicKey<B>& key, InIter begin, InIter end, OutIter out)
{
    std::vector<uint8_t> encoded(B/8);
    util::Error err = util::OAEPEncode(begin, end, encoded.begin(), B/8);
    if (err != util::Error::Ok)
        return {err, out};
    BigUInt<B> bi = bytesToBigUInt<B>(encoded.begin(), encoded.end());
    BigUInt<B> encrypted = modularExp_GNK(bi, key.e, key.n, GNKCtx<B>(key.n));    
    auto outEnd = BigUIntToBytes(encrypted, out);
    return {util::Error::Ok, outEnd};
}

template<std::size_t B, typename InIter, typename OutIter>
std::pair<util::Error, OutIter>
decrypt(PrivateKey<B>& key, InIter begin, InIter end, OutIter out)
{
    if (end - begin > B/8) {
        return {util::Error::LengthError, out};
    }
    BigUInt<B> cipher = bytesToBigUInt<B>(begin, end);
    BigUInt<B> decrypted = decryptUsingChineseRemainderTheorem(
        cipher, key, GNKCtx<B/2>(key.p), GNKCtx<B/2>(key.q));
    std::vector<uint8_t> encoded(B/8);
    BigUIntToBytes(decrypted, encoded.begin());
    return util::OAEPDecode(encoded.begin(), encoded.end(), out);
}

template<std::size_t B, typename InIter, typename OutIter>
std::pair<util::Error, OutIter>
sign(PrivateKey<B>& key, InIter begin, InIter end, OutIter out)
{
    // use sha256
    util::Error e;
    std::vector<uint8_t> hashVal(256/8);
    sha::fileDigest_sha256(begin, end, hashVal.begin());
    std::vector<uint8_t> pss(B/8, 0);
    e = util::PSSEncode(hashVal.begin(), hashVal.end(), pss.begin(), B/8, 16);
    if (e != util::Error::Ok)
        return {e, out};
    BigUInt<B> pssBi = bytesToBigUInt<B>(pss.begin(), pss.end());
    // for (auto e : pss) {
    //     fmt::print("0x{:02x}:", e);
    // }
    // fmt::print("\n");
    // fmt::print("pssBi significant:{}\n", pssBi.countSignificand());
    // fmt::print("key.n significant:{}\n", key.n.countSignificand());
    // if (pssBi >= key.n) {

    //     throw 0;
    // }
    // fmt::print("pssBi={}\n", pssBi.toHex());
    BigUInt<B> enc = decryptUsingChineseRemainderTheorem(
        pssBi, key, GNKCtx<B/2>(key.p), GNKCtx<B/2>(key.q));
    return {util::Error::Ok, BigUIntToBytes(enc, out)};
}

template<std::size_t B, typename MsgIter, typename SignatureIter>
util::Error verify(PublicKey<B>& key, MsgIter begin, MsgIter end,
                   SignatureIter sbegin, SignatureIter send)
{
    util::Error e;
    std::vector<uint8_t> hashVal(256/8);
    sha::fileDigest_sha256(begin, end, hashVal.begin());
    
    BigUInt<B> signatureBi = bytesToBigUInt<B>(sbegin, send);
    BigUInt<B> pssBi = modularExp_GNK(signatureBi, key.e, key.n, GNKCtx<B>(key.n));
    // fmt::print("pssBi={}\n", pssBi.toHex());
    std::vector<uint8_t> pss(B/8);
    BigUIntToBytes(pssBi, pss.begin());
    return util::PSSVerify(hashVal.begin(), hashVal.end(), pss.begin(), pss.end());
}


// used for file manip


namespace detail
{
template<std::size_t B>
void insertInteger(std::vector<uint8_t>& bin, BigUInt<B> const& bi)
{
    bin.push_back(0x2);
    std::vector<uint8_t> biBin;
    BigUIntToBytesTrim(bi, std::back_inserter(biBin));
    auto size = biBin.size();
    if (size <= 0x7f) {
        bin.push_back((uint8_t)size);
    } else if (size <= 0xff) {
        bin.push_back(0x81);
        bin.push_back((uint8_t)size);
    } else {
        bin.push_back(0x82);
        bin.push_back((size >> 8) & 0xff);
        bin.push_back(size & 0xff);
    }
    bin.insert(bin.end(), biBin.begin(), biBin.end());
}
}

std::optional<KeyRaw> readKeyFile(std::istream&);
template<std::size_t KeyBits>
void writePublicKey(std::ostream& os, PublicKey<KeyBits> const& key)
{
    os << "-----BEGIN RSA PUBLIC KEY-----\n";

    std::vector<uint8_t> derData;
    derData.push_back(0x30);
    derData.push_back(0x82);
    derData.push_back(0x00);
    derData.push_back(0x00);

    std::vector<uint8_t> derDataBody;
    detail::insertInteger(derDataBody, key.n);
    detail::insertInteger(derDataBody, key.e);

    derData[2] = (derDataBody.size() >> 8) & 0xff;
    derData[3] = derDataBody.size() & 0xff;
    derData.insert(derData.end(), derDataBody.begin(), derDataBody.end());

    os << util::binaryToBase64(derData.begin(), derData.end());
    
    os << "\n-----END RSA PUBLIC KEY-----\n";
}

template<std::size_t KeyBits>
void writePrivateKey(std::ostream& os, PrivateKey<KeyBits> const& key)
{
    os << "-----BEGIN RSA PRIVATE KEY-----\n";

    std::vector<uint8_t> derData;
    derData.push_back(0x30);
    derData.push_back(0x82);
    derData.push_back(0x00);
    derData.push_back(0x00);
    
    std::vector<uint8_t> derDataBody;
    // version
    derDataBody.push_back(0x2);
    derDataBody.push_back(0x1);
    derDataBody.push_back(0x0);
    detail::insertInteger(derDataBody, key.n);
    detail::insertInteger(derDataBody, key.e);
    detail::insertInteger(derDataBody, key.d);
    detail::insertInteger(derDataBody, key.p);
    detail::insertInteger(derDataBody, key.q);
    detail::insertInteger(derDataBody, key.d1);
    detail::insertInteger(derDataBody, key.d2);
    detail::insertInteger(derDataBody, key.qInv);

    derData[2] = (derDataBody.size() >> 8) & 0xff;
    derData[3] = derDataBody.size() & 0xff;
    derData.insert(derData.end(), derDataBody.begin(), derDataBody.end());

    // for (auto e : derData) {
    //     fmt::print("{:02x}:", e);
    // }
    // fmt::print("\n");

    os << util::binaryToBase64(derData.begin(), derData.end());
    
    os << "\n-----END RSA PRIVATE KEY-----\n";
}

template<std::size_t KeyBits>
PrivateKey<KeyBits> keyGen(int threadNum)
{
    auto diff = [](BigUInt<KeyBits/2> const& a,
                   BigUInt<KeyBits/2> const& b) {
        if (a > b) return a - b;
        else return b - a;
    };
        
    BigUInt<KeyBits/2> minDiffAllowed{}; // 2^(KeyBits/4+1)
    minDiffAllowed[KeyBits/4/32] = 2;
    BigUInt<KeyBits> minDAllowed{};
    minDAllowed[KeyBits/4/32] = 1;
    minDAllowed = (minDAllowed + BigUInt<KeyBits>(2)) / BigUInt<KeyBits>(3);
    PrivateKey<KeyBits> key;
    key.e = BigUInt<KeyBits>{65537};
    bool done = false;
    while (!done) {
        key.p = primeGen_par<KeyBits/2>(threadNum);
        key.q = primeGen_par<KeyBits/2>(threadNum);
        if (diff(key.p, key.q) >= minDiffAllowed) {
            key.n = fullMultiply_comba_simd(key.p, key.q);
            if (modInverse(key.e,
                           fullMultiply_comba_simd(key.p-1, key.q-1),
                           key.d)) {
                if (key.d >= minDAllowed) {
                    done = true;
                    key.d1 = modLess(key.d, key.p-1);
                    key.d2 = modLess(key.d, key.q-1);
                    modInverse(key.q, key.p, key.qInv);
                } else {
                    fmt::print("d fail\n");
                }
            }
        } else {
            fmt::print("diff fail\n");
        }
    }

    return key;
}

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
        decryptFile_par(src, dst, key, threadNum);
    } else {
        decryptFile_serial(src, dst, key);
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
    if (util::noMoreData(src)) {
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
        if (util::noMoreData(src)) {
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
    if (util::noMoreData(src)) {
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

        if (util::noMoreData(src)) {            
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
            m1 = modularExp_GNK_w4
                (cipher1, key.d1, key.p, pContext);
        });

        auto fut2 = std::async([&cipher, &key, &qContext, &m2](){
            auto cipher2 = modLess(cipher, key.q);
            m2 = modularExp_GNK_w4
                (cipher2, key.d2, key.q, qContext);
        });
        fut1.wait();
        fut2.wait();
        auto h = modLess(fullMultiply(key.qInv,
                                      signedMod(std::move(m1).template resizeMove<KeyBits/2+32>() - m2.template resize<KeyBits/2+32>(), key.p.template resize<KeyBits/2+32>()).template resizeMove<KeyBits/2>()), key.p);
        auto m = m2.template resize<KeyBits>() + fullMultiply(h, key.q);
        return m;
    } else {
        // auto cipher1 = modLess(cipher, key.p);
        // auto m1 = modularExp_GNK(cipher1, key.d1, key.p, pContext);
        // auto cipher2 = modLess(cipher, key.q);
        // // fmt::print("1s in d1: {0}\n1s in d2: {1}\n", count1(d1), count1(d2));
        // auto m2 = modularExp_GNK(cipher2, key.d2, key.q, qContext);
        // auto m = fullMultiply(fullMultiply(m1, key.q), key.qInv.template resize<KeyBits>())
        //     + fullMultiply(fullMultiply(m2, key.p), key.pInv.template resize<KeyBits>());
        // return modLess(m, key.n);
        
        auto cipher1 = modLess(cipher, key.p);
        auto m1 = modularExp_GNK_w4(cipher1, key.d1, key.p, pContext);
        auto cipher2 = modLess(cipher, key.q);
        auto m2 = modularExp_GNK_w4(cipher2, key.d2, key.q, qContext);
        auto h = modLess(fullMultiply(key.qInv,
                                      signedMod(std::move(m1).template resizeMove<KeyBits/2+32>() - m2.template resize<KeyBits/2+32>(), key.p.template resize<KeyBits/2+32>()).template resizeMove<KeyBits/2>()), key.p);
        auto m = m2.template resize<KeyBits>() + fullMultiply(h, key.q);
        return m;
    }
}

} // namespace rsa

