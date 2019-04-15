#include <x86intrin.h>
#include "fullMultiply_alter.hpp"

void fullMultiply_normal_impl(uint32_t* result, uint32_t* lhs, uint32_t* rhs, std::size_t const len)
{    
    for (std::size_t i = 0; i < len; ++i) {
        uint64_t carry = 0;
        for (std::size_t j = 0; j < len; ++j) {
            uint64_t sum = (uint64_t)rhs[i] * lhs[j] + result[i+j] + carry;
            result[i+j] = sum;
            carry = (sum >> 16) >> 16;
        }
        result[i + len] = carry;
    }
}

void fullMultiply_comba16_impl(uint16_t* result, uint16_t const* lhs,
                             uint16_t const* rhs, std::size_t const len)
{
    // assume result is zero-inited
    std::size_t lIdx = 0, hIdx = 0;
    uint64_t colSum = 0;
    for (std::size_t i = 0; i < 2 * len - 1; ++i) {
        auto rg = lIdx + hIdx;
        for (auto j = lIdx; j <= hIdx; ++j) {
            uint64_t prod = static_cast<uint64_t>(lhs[j]) * rhs[rg - j];
            colSum += prod;
        }
        result[i] = colSum & 0xffff;
        colSum = colSum >> 16;
        auto cond = (hIdx != len-1);
        hIdx += cond ? 1 : 0;
        lIdx += cond ? 0 : 1;
    }

    result[2*len - 1] = colSum & 0xffff;
}

void fullMultiply_comba16_simd_impl(uint16_t* result, uint16_t const* lhs,
                                  uint16_t const* rhs, std::size_t const len)
{
    // assume result is zero-inited
    std::size_t lIdx = 0, hIdx = 0;
    uint64_t colSum = 0;
    for (std::size_t i = 0; i < 2 * len - 1; ++i) {
        auto rg = lIdx + hIdx;
        std::size_t j = lIdx;
        for (j = lIdx; j + 7 <= hIdx; j += 8) {
            __m256i lhsVec = _mm256_set_epi32(lhs[j], lhs[j+1], lhs[j+2], lhs[j+3],
                                             lhs[j+4], lhs[j+5], lhs[j+6], lhs[j+7]);
            // __m256i lhsVec = _mm256_load
            __m256i rhsVec = _mm256_set_epi32(rhs[rg-j], rhs[rg-j-1], rhs[rg-j-2], rhs[rg-j-3],
                                              rhs[rg-j-4], rhs[rg-j-5], rhs[rg-j-6], rhs[rg-j-7]);
            __m256i prodVec = _mm256_mullo_epi32(lhsVec, rhsVec);
            auto p = (uint32_t*) &prodVec;
            colSum += (uint64_t)p[0] + (uint64_t)p[1] + (uint64_t)p[2] +
                (uint64_t)p[3] + (uint64_t)p[4] + (uint64_t)p[5] +
                (uint64_t)p[6] + (uint64_t)p[7];
        }
        // for (; j + 3 <= hIdx; j += 4) {
        //     // __m256i lhsVec = _mm256_setr_epi32(lhs[j], 0, lhs[j+1], 0, lhs[j+2], 0, lhs[j+3], 0);
        //     // __m256i rhsVec = _mm256_setr_epi32(rhs[rg-j], 0, rhs[rg-j-1], 0, rhs[rg-j-2], 0, rhs[rg-j-3], 0);
        //     // __m256i prodVec = _mm256_mul_epu32(lhsVec, rhsVec);
        //     __m256i lhsVec = _mm256_setr_epi64x(lhs[j], lhs[j+1], lhs[j+2], lhs[j+3]);
        //     __m256i rhsVec = _mm256_setr_epi64x(rhs[rg-j], rhs[rg-j-1], rhs[rg-j-2], rhs[rg-j-3]);
        //     __m256i prodVec = _mm256_mul_epu32(lhsVec, rhsVec);
        //     auto p = (uint64_t*) &prodVec;
        //     colSum += p[0] + p[1] + p[2] + p[3];
        // }
        for (; j <= hIdx; ++j) {
            uint64_t prod = (uint64_t)lhs[j] * rhs[rg - j];
            colSum += prod;
        }
        result[i] = colSum & 0xffff;
        colSum = colSum >> 16;
        if (hIdx != len - 1)
            ++hIdx;
        else
            ++lIdx;
    }

    result[2*len - 1] = colSum & 0xffff;
}

void fullMultiply_comba_impl(uint32_t* result, uint32_t const* lhs,
                             uint32_t const* rhs, std::size_t const len)
{
    constexpr uint64_t mask = 0xffffffff;
    uint64_t r0 = 0, r1 = 0, r2 = 0;

    for (std::size_t k = 0; k < len; ++k) {
        std::size_t j;
        
        for (std::size_t i = 0; i <= k; ++i) {
            j = k - i;
            uint64_t prod = uint64_t(lhs[i]) * rhs[j];
            r0 += (prod & mask);
            r1 += (prod >> 32);
        }
        
        r1 += (r0 >> 32);
        r2 += (r1 >> 32);
        result[k] = r0;
        r0 = (r1 & mask);
        r1 = (r2 & mask);
        r2 = 0;
    }

    for (std::size_t k = len, l = 1; k < 2*len - 1; ++k, ++l) {
        std::size_t j;
        for (std::size_t i = l; i < len; ++i) {
            j = k - i;
            uint64_t prod = uint64_t(lhs[i]) * rhs[j];
            r0 += (prod & mask);
            r1 += prod >> 32;
        }
        r1 += r0 >> 32;
        r2 += r1 >> 32;
        result[k] = r0;
        r0 = (r1 & mask);
        r1 = (r2 & mask);
        r2 = 0;
    }
    result[2*len - 1] = r0;
}

void fullMultiply_comba_openmp_impl(uint32_t* result, uint32_t const* lhs,
                                    uint32_t const* rhs, std::size_t const len)
{
    // slow and not correct
    constexpr uint64_t mask = 0xffffffff;
    uint64_t r0 = 0, r1 = 0, r2 = 0;
    for (std::size_t k = 0; k < len; ++k) {
        #pragma omp parallel for
        for (std::size_t i = 0; i <= k; ++i) {
            std::size_t j = k - i;
            uint64_t prod = uint64_t(lhs[i]) * rhs[j];
            r0 += (prod & mask);
            r1 += (prod >> 32);
        }
        r1 += (r0 >> 32);
        r2 += (r1 >> 32);
        result[k] = r0;
        r0 = (r1 & mask);
        r1 = (r2 & mask);
        r2 = 0;
    }

    for (std::size_t k = len, l = 1; k < 2*len - 1; ++k, ++l) {
        std::size_t i = l, j;
        #pragma omp parallel for
        for (std::size_t i = l; i < len; ++i) {
            std::size_t j = k - i;
            uint64_t prod = uint64_t(lhs[i]) * rhs[j];
            r0 += (prod & mask);
            r1 += prod >> 32;
        }
        r1 += r0 >> 32;
        r2 += r1 >> 32;
        result[k] = r0;
        r0 = (r1 & mask);
        r1 = (r2 & mask);
        r2 = 0;
    }
    result[2*len - 1] = r0;
}

void fullMultiply_comba_simd_impl(uint32_t* result, uint32_t const* lhs,
                                  uint32_t const* rhs, std::size_t const len)
{
    constexpr uint64_t mask = 0xffffffff;
    __m256i maskVec = _mm256_set1_epi64x(mask);
    uint64_t r0 = 0, r1 = 0, r2 = 0;
    for (std::size_t k = 0; k < len; ++k) {
        std::size_t i, j;
        __m256i shiftedSum = _mm256_setzero_si256();
        __m256i maskedSum = _mm256_setzero_si256();
        bool simded = (3 <= k);
        for (i = 0; i + 3 <= k; i += 4) {
            __m256i lhsVec = _mm256_cvtepu32_epi64(
                _mm_loadu_si128(reinterpret_cast<__m128i const*>(lhs+i))
                );
            __m256i rhsVec = _mm256_cvtepu32_epi64(
                _mm_shuffle_epi32(
                    _mm_loadu_si128(reinterpret_cast<__m128i const*>(rhs+k-i-3)),
                    _MM_SHUFFLE(0, 1, 2, 3)
                    )
                );
            __m256i prod = _mm256_mul_epu32(lhsVec, rhsVec);           
            __m256i shifted = _mm256_srli_epi64(prod, 32);
            __m256i masked = _mm256_and_si256(prod, maskVec);         
            shiftedSum = _mm256_add_epi64(shifted, shiftedSum);
            maskedSum = _mm256_add_epi64(masked, maskedSum);
        }
        // if (simded)
        {
            auto pshifted = (uint64_t*) &shiftedSum;
            auto pmasked = (uint64_t*) &maskedSum;
            r0 += pmasked[0] + pmasked[1] + pmasked[2] + pmasked[3];
            r1 += pshifted[0] + pshifted[1] + pshifted[2] + pshifted[3];
        }
        for (; i <= k; ++i) {
            j = k - i;
            uint64_t prod = uint64_t(lhs[i]) * rhs[j];
            r0 += (prod & mask);
            r1 += (prod >> 32);
        }
        r1 += (r0 >> 32);
        r2 += (r1 >> 32);
        result[k] = r0;
        r0 = (r1 & mask);
        r1 = (r2 & mask);
        r2 = 0;
    }

    for (std::size_t k = len, l = 1; k < 2*len - 1; ++k, ++l) {
        std::size_t i, j;
        __m256i shiftedSum = _mm256_setzero_si256();
        __m256i maskedSum = _mm256_setzero_si256();
        bool simded = (l + 3 < len);
        for (i = l; i + 3 < len; i += 4) {
            __m256i lhsVec = _mm256_cvtepu32_epi64(
                _mm_lddqu_si128(reinterpret_cast<__m128i const*>(lhs+i))
                );
            __m256i rhsVec = _mm256_cvtepu32_epi64(
                _mm_shuffle_epi32(
                    _mm_lddqu_si128(reinterpret_cast<__m128i const*>(rhs+k-i-3)),
                    _MM_SHUFFLE(0, 1, 2, 3)
                    )
                );
            __m256i prod = _mm256_mul_epu32(lhsVec, rhsVec);
            
            // actually 32bit efficient data
            __m256i shifted = _mm256_srli_epi64(prod, 32);
            __m256i masked = _mm256_and_si256(prod, maskVec);
            shiftedSum = _mm256_add_epi64(shifted, shiftedSum);
            maskedSum = _mm256_add_epi64(masked, maskedSum);
        }
        // if (simded)
        {
            auto pshifted = (uint64_t*) &shiftedSum;
            auto pmasked = (uint64_t*) &maskedSum;
            r0 += pmasked[0] + pmasked[1] + pmasked[2] + pmasked[3];
            r1 += pshifted[0] + pshifted[1] + pshifted[2] + pshifted[3];
        }
        for (; i < len; ++i) {
            j = k - i;
            uint64_t prod = uint64_t(lhs[i]) * rhs[j];
            r0 += (prod & mask);
            r1 += prod >> 32;
        }
        r1 += r0 >> 32;
        r2 += r1 >> 32;
        result[k] = r0;
        r0 = (r1 & mask);
        r1 = (r2 & mask);
        r2 = 0;
    }
    result[2*len - 1] = r0;
}
