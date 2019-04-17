#include "./biguint.hpp"
#include <cmath>
#include <fmt/format.h>
#include <array>
#include <x86intrin.h>
#include <chrono>
#include "./ThreadSupport.hpp"

// constexpr std::size_t buffBitLength(std::size_t B)
// {
//     std::size_t ans = (std::size_t)std::ceil(std::log2(B)) + 59;
//     while (ans % 32 != 0) {
//         ++ans;
//     }
//     return ans;
// }

// template<std::size_t B>
// void addU64(BigUInt<B>& bu, uint64_t v)
// {
//     auto Sz = BigUInt<B>::VLEN;
//     constexpr uint64_t mask = 0xffffffff;
//     uint32_t lo = v;
//     uint32_t hi = v >> 32;
//     uint64_t sum = (uint64_t)bu.data()[0] + lo;
//     bu.data()[0] = sum & mask;
//     uint64_t carry = (sum & (~mask)) > 0 ? 1 : 0;

//     sum = (uint64_t)bu.data()[1] + hi + carry;
//     bu.data()[1] = sum & mask;
//     carry = (sum & (~mask)) > 0 ? 1 : 0;

//     for (int i = 2; carry > 0 && i < Sz; ++i) {
//         sum = (uint64_t)bu.data()[i] + carry;
//         bu.data()[i] = sum & mask;
//         carry = (sum & (~mask)) > 0 ? 1 : 0;
//     }
// }

// template<std::size_t B>
// uint32_t rshift32(BigUInt<B>& v)
// {
//     auto Sz = BigUInt<B>::VLEN;
//     auto ret = v.data()[0];
//     for (int i = 0; i < Sz - 1; ++i) {
//         v.data()[i] = v.data()[i+1];
//     }
//     v.data()[Sz - 1] = 0;
//     return ret;
// }

static void
addInPlace(std::vector<uint32_t>& lhs,
	   std::vector<uint32_t> const& rhs,
           std::size_t from = 0)
{
    assert(lhs.size() == rhs.size());
    std::size_t sz = lhs.size();
    // if (to == 0) to = sz;
    uint64_t carry = 0;
    uint64_t mask = 0xffffffff;
    for (std::size_t i = from; i < sz; ++i) {
	uint64_t sum = static_cast<uint64_t>(lhs[i])
            + rhs[i] + carry;
	lhs[i] = sum & mask;
	carry = (sum & (~mask)) > 0 ? 1 : 0;
    }

}

template <std::size_t B1, std::size_t B2>
BigUInt<B1+B2> fullMultiply_multithrd_spin(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs, MulCtx_normal_multithrd& ctx)
{
    BigUInt<B1+B2> result;
    int thrdNum = ctx.thrdNum();
    std::size_t n = BigUInt<B2>::VLEN;
    const std::size_t workLoad = n / thrdNum;
    std::size_t rmd = n - workLoad * thrdNum;
    std::size_t j = 0;
    int i;
    for (i = 0; i < rmd; ++i) {
        auto p = j;
        j += workLoad + 1;
        ctx.addRange(i, p, j);
    }
    for (; i < thrdNum; ++i) {
        auto p = j;
        j += workLoad;
        ctx.addRange(i, p, j);
    }
    
    ctx.start(lhs.data(), rhs.data(), result.data());
    while (!ctx.done()) {
        // std::this_thread::yield();
    }

    std::vector<std::vector<uint32_t>>& buffers = ctx.buffers();
    for (auto& v : buffers) {
        addInPlace(result.data(), v);
    }
    ctx.stop();

    return result;    
}

// template <std::size_t B1, std::size_t B2>
// BigUInt<B1+B2> fullMultiply_multithrd_spin2(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs, FixedSpinTaskPool& pool)
// {
//     BigUInt<B1+B2> result;
//     int thrdNum = pool.thrdNum();
//     std::size_t n = BigUInt<B2>::VLEN;
//     const std::size_t workLoad = n / thrdNum;
//     std::size_t rmd = n - workLoad * thrdNum;
//     std::size_t j = 0;
//     int i;

//     std::vector<std::vector<uint32_t>> buffers(thrdNum);
    
//     struct Task : FixedSpinTaskPool::TaskBase
//     {
//         std::vector<uint32_t> const* lhs;
//         std::vector<uint32_t> const* rhs;
//         std::vector<uint32_t>* buf;
//         std::size_t beg;
//         std::size_t end;

//         Task(std::vector<uint32_t> const* l, std::vector<uint32_t> const* r,
//              std::vector<uint32_t>* b, std::size_t bg, std::size_t ed)
//             : lhs(l), rhs(r), buf(b), beg(bg), end(ed) {}

//         void operator()() override
//         {
//             auto len = lhs->size();
//             buf->resize(lhs->size() + rhs->size(), 0);
//             constexpr uint64_t mask = 0xffffffff;
//             uint64_t carry;
//             for (std::size_t i = beg; i < end; ++i) {
//                 carry = 0;
//                 for (std::size_t j = 0; j < len; ++j) {
//                     auto sum = (*buf)[i+j]
//                         + static_cast<uint64_t>((*lhs)[j]) * (*rhs)[i]
//                         + carry;
//                     static_assert(sizeof sum == 8);
//                     (*buf)[i+j] = sum & mask;
//                     carry = (sum >> 16) >> 16;
//                 }
//                 (*buf)[i + len] += carry;
//             }
//         }
//     };
//     std::vector<Task> taskVec;
//     taskVec.reserve(thrdNum);
    
//     for (i = 0; i < rmd; ++i) {
//         auto p = j;
//         j += workLoad + 1;
//         taskVec.emplace_back(&lhs.data(), &rhs.data(), &buffers[i], p, j);
//         pool.addTask(i, &taskVec.back());
//     }
//     for (; i < thrdNum; ++i) {
//         auto p = j;
//         j += workLoad;
//         taskVec.emplace_back(&lhs.data(), &rhs.data(), &buffers[i], p, j);
//         pool.addTask(i, &taskVec.back());
//     }
//     pool.startAll();

//     while (pool.numDone() != thrdNum) {
//         std::this_thread::yield();
//     }
//     pool.stop();
    
//     for (auto& v : buffers) {
//         addInPlace(result.data(), v);
//     }

//     return result;    
// }

template <std::size_t B1, std::size_t B2>
BigUInt<B1 + B2>
fullMultiply_simd(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs)
{
    BigUInt<B1 + B2> result;
    constexpr uint64_t mask = 0xffffffff;
    // uint64_t arr[4];
    for (std::size_t i = 0; i < BigUInt<B2>::VLEN; ++i) {
        std::uint32_t carry = 0;
        std::size_t j;
        __m256i mtor = _mm256_set1_epi32(rhs.data()[i]);
        for (j = 0; j + 3 < BigUInt<B1>::VLEN; j += 4) {
            __m128i mend128 = _mm_loadu_si128(reinterpret_cast<__m128i const*>(lhs.data().data()+j));
            __m256i mend = _mm256_cvtepu32_epi64(mend128);
            __m256i prod = _mm256_mul_epu32(mtor, mend);
            // _mm256_storeu_si256((__m256i*)arr, prod);
            auto arr = (uint64_t*)&prod;
            uint64_t sum;
            std::size_t idx = i + j;
            sum = static_cast<uint64_t>(result.data()[idx])
                + arr[0] + carry;                
            result.data()[idx++] = (sum & mask);
            carry = (sum >> 16) >> 16;
            sum = static_cast<uint64_t>(result.data()[idx])
                + arr[1] + carry;                
            result.data()[idx++] = (sum & mask);
            carry = (sum >> 16) >> 16;
            sum = static_cast<uint64_t>(result.data()[idx])
                + arr[2] + carry;
            result.data()[idx++] = (sum & mask);
            carry = (sum >> 16) >> 16;
            sum = static_cast<uint64_t>(result.data()[idx])
                + arr[3] + carry;                
            result.data()[idx] = (sum & mask);
            carry = (sum >> 16) >> 16;
        }
        
        for (; j < BigUInt<B1>::VLEN; ++j) {
            uint64_t sum = static_cast<uint64_t>(result.data()[i + j])
                + lhs.data()[j] * static_cast<uint64_t>(rhs.data()[i]) + carry;
            result.data()[i + j] = (sum & mask);
            carry = (sum >> 16) >> 16;
        }

        result.data()[i + j] += carry;
    }

    return result;
}


void fullMultiply_comba16_impl(uint16_t* result, uint16_t const* lhs,
                             uint16_t const* rhs, std::size_t const len);

template<std::size_t B>
BigUInt<B * 2> fullMultiply_comba16(BigUInt<B> const& lhs, BigUInt<B> const& rhs)
{
    BigUInt<B * 2> result;
    fullMultiply_comba16_impl((uint16_t*)result.data().data(),
                            (uint16_t const*)lhs.data().data(),
                            (uint16_t const*)rhs.data().data(), 2 * BigUInt<B>::VLEN);
    return result;
}

void fullMultiply_comba16_simd_impl(uint16_t* result, uint16_t const* lhs,
                                  uint16_t const* rhs, std::size_t const len);
template<std::size_t B>
BigUInt<B * 2> fullMultiply_comba16_simd(BigUInt<B> const& lhs, BigUInt<B> const& rhs)
{
    BigUInt<B * 2> result;
    fullMultiply_comba16_simd_impl((uint16_t*)result.data().data(),
                                 (uint16_t const*)lhs.data().data(),
                                 (uint16_t const*)rhs.data().data(), 2 * BigUInt<B>::VLEN);
    return result;
}

void fullMultiply_comba_impl(uint32_t* result, uint32_t const* lhs,
                             uint32_t const* rhs, std::size_t const len);
template<std::size_t B>
BigUInt<B * 2> fullMultiply_comba(BigUInt<B> const& lhs, BigUInt<B> const& rhs)
{
    BigUInt<B * 2> result;
    fullMultiply_comba_impl(result.data().data(), lhs.data().data(),
                            rhs.data().data(), BigUInt<B>::VLEN);
    return result;
}

void fullMultiply_comba_openmp_impl(uint32_t* result, uint32_t const* lhs,
                                    uint32_t const* rhs, std::size_t const len);
template<std::size_t B>
BigUInt<B * 2> fullMultiply_comba_openmp(BigUInt<B> const& lhs, BigUInt<B> const& rhs)
{
    BigUInt<B * 2> result;
    fullMultiply_comba_openmp_impl(result.data().data(), lhs.data().data(),
                            rhs.data().data(), BigUInt<B>::VLEN);
    return result;
}

void fullMultiply_comba_simd_impl(uint32_t* result, uint32_t const* lhs,
                                  uint32_t const* rhs, std::size_t const len);
template<std::size_t B>
BigUInt<B * 2> fullMultiply_comba_simd(BigUInt<B> const& lhs, BigUInt<B> const& rhs)
{
    BigUInt<B * 2> result;
    fullMultiply_comba_simd_impl(result.data().data(), lhs.data().data(),
                            rhs.data().data(), BigUInt<B>::VLEN);
    return result;
}

struct Multiplier_comba_simd
{
    template<std::size_t B>
    BigUInt<B*2> operator()(BigUInt<B> const& lhs, BigUInt<B> const& rhs) {
        return fullMultiply_comba_simd(lhs, rhs);
    }
};

struct Multiplier_normal
{
    template<std::size_t B1, std::size_t B2>
    BigUInt<B1+B2> operator()(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs) {
        return fullMultiply(lhs, rhs);
    }
};
