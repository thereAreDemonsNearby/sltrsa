#ifndef NTALGO_HPP_
#define NTALGO_HPP_
#include <utility>
#include <type_traits>
#include <iterator>
#include <random>
#include <tuple>
#include <thread>
#include <atomic>
#include <iostream>
#include <x86intrin.h>
#include <boost/align.hpp>
#include "biguint.hpp"
#include "TimerGuard.h"
#include "fullMultiply_alter.hpp"

template<typename T>
struct hasDivide
{
    static constexpr bool value = false;
};

template<std::size_t B>
struct hasDivide<BigUInt<B>>
{
    static constexpr bool value = true;
};

template<typename Integer>
class BitIterator : public std::bidirectional_iterator_tag
{
    static_assert(std::is_integral<Integer>::value, "not integer");
private:
    Integer num;
    int offset;
public:
    BitIterator(Integer n) : num(n), offset(0) {}
    BitIterator(Integer n, int s) : num(n), offset(s) {}
    bool operator== (const BitIterator& rhs) {
	return (offset >= 8 * sizeof(Integer) && rhs.offset >= 8 * sizeof(Integer))
	    || (offset <= -1 && rhs.offset <= -1)
	    || (num == rhs.num && offset == rhs.offset);
    }
    bool operator!= (const BitIterator& rhs) { return !(operator==(rhs)); }
    bool operator*() {
	Integer mask{1};
	mask <<= offset;
	return mask & num;
    }
    BitIterator& operator++() {	++offset; return *this; }
    BitIterator& operator--() {	--offset; return *this; }
    static BitIterator end() { return {0, sizeof(Integer)*8}; }
    static BitIterator beforeBegin() { return {0, -1}; }
};

template<std::size_t B>
class BitIterator<BigUInt<B>> : public std::bidirectional_iterator_tag
{
private:
    const BigUInt<B>* nump;
    int index;
    int offset;

    BitIterator(const BigUInt<B>& p, int ind, int off)
	: nump(&p), index(ind), offset(off) {}
    BitIterator(const BigUInt<B>* p, int ind, int off)
	: nump(p), index(ind), offset(off) {}
public:
    BitIterator(const BigUInt<B>& p, int off = 0)
	: nump(&p), index(off / 32), offset(off % 32) {}
    
    bool operator==(const BitIterator& rhs) {
	return (index <= -1 && rhs.index <= -1)
	    || (index >= B/32 && rhs.index >= B/32)
	    || (nump == rhs.nump && index == rhs.index
		&& offset == rhs.offset);			
    }
    
    bool operator!= (const BitIterator& rhs) { return !(operator==(rhs)); }

    bool operator*() {
	uint32_t mask = (uint32_t)1 << offset;
	return nump->data()[index] & mask;
    }

    BitIterator& operator++() {
	++offset;
	if (offset == 32) {
	    offset = 0;
	    ++index;
	}
	return *this;
    }
    BitIterator& operator--() {
	--offset;
	if (offset == -1) {
	    offset = 31;
	    --index;
	}
	return *this;
    }
    static BitIterator end() { return {nullptr, B/32, 0}; }
    static BitIterator beforeBegin() {	return {nullptr, -1, 31}; }
};

template<typename Int>
std::size_t count1(Int const& i)
{
    BitIterator<Int> iter(i);
    BitIterator<Int> end = BitIterator<Int>::end();
    std::size_t cnt = 0;
    while (iter != end) {
        if (*iter)
            cnt++;
        ++iter;
    }
    return cnt;
}

template<typename Int>
struct Width
{
    constexpr int operator()() {
	static_assert(std::is_integral<Int>::value, "not integer");
	return 8 * sizeof(Int);
    }
};

template<std::size_t B>
struct Width<BigUInt<B>>
{
    constexpr int operator()() {
	return B;
    }
};

template<typename Int>
struct Random
{
    static_assert(std::is_integral<Int>::value, "not integer");
    Int operator()(Int low, Int high) {
	static std::random_device rd;
	std::uniform_int_distribution<Int> dist(low, high);
	return dist(rd);
    }
};

template<std::size_t B>
struct Random<BigUInt<B>>
{
    BigUInt<B> operator()(BigUInt<B> const& low, BigUInt<B> const& high) {
	BigUInt<B> ret = BigUInt<B>::randomGen() % (high - low + 1);
	return ret + low;	
    }
};

// assume that all operands are non-negative
template<typename Integer>
Integer gcd(Integer a, Integer b)
{
    Integer zero{0};
    while (b != zero) {
	Integer rmd = a % b;
	a = b;
	b = rmd;
    }

    return a;
}

template<typename Integer>
std::tuple<Integer, Integer, Integer> // gcdval, bezout coefficient
exgcd(const Integer& a, const Integer& b,
      typename std::enable_if<!hasDivide<Integer>::value>::type* = nullptr)
{    
    if (b == Integer(0)) {
	return {a, Integer(1), Integer(0)};
    }

    auto q = a / b;
    auto tup = exgcd(b, a % b);
    return { std::get<0>(tup), std::get<2>(tup),
	     std::get<1>(tup) - std::get<2>(tup) * q };
}

template<typename Integer>
std::tuple<Integer, Integer, Integer>
exgcd(const Integer& a, const Integer& b,
      typename std::enable_if<hasDivide<Integer>::value>::type* = nullptr)
{
    if (b == Integer(0)) {
	return {a, Integer(1), Integer(0)};
    }

    auto q = a;
    auto rmd = q.divide(b);
    auto tup = exgcd(b, rmd);
    return { std::get<0>(tup), std::get<2>(tup),
	     std::get<1>(tup) - std::get<2>(tup) * q };
}


// ax = b (mod n), compute x
template<typename Integer>
bool modularLinearEquation(Integer* result, const Integer& a, const Integer& b, const Integer& n)
{
    auto tup = exgcd(a, n); // d, s, t
    auto rmd = b % std::get<0>(tup); // test if d|b
    if (rmd != Integer(0)) {
	return false;
    }

    if (result != nullptr)
	*result = (std::get<1>(tup) * b / std::get<0>(tup)) % n;
    return true;
}

template<std::size_t B>
BigUInt<B> modularExp(const BigUInt<B>& a, const BigUInt<B>& b, const BigUInt<B>& n)
{
    const std::size_t ExB = 2 * B;
    BigUInt<ExB> d{1};
    BigUInt<ExB> exA = a.extend();
    BigUInt<ExB> exN = n.extend();
    BitIterator<BigUInt<B>>
	bIter{b, Width<BigUInt<B>>()() - 1};
    auto end = BitIterator<typename std::decay<decltype(b)>::type>::beforeBegin();
    while (!(*bIter)) {
	--bIter;
    }
    
    while (bIter != end) {
	d = (d * d) % exN;
	if (*bIter) {
	    d = (d * exA) % exN;
	}
	--bIter;
    }
    return d.trunc();
}

template <std::size_t B>
std::tuple<BigUInt<B>, BigUInt<B>, BigUInt<B>>
findR(BigUInt<B> const& modulusExtended)
{
    // one more word
    BigUInt<B> r{};    
    r.data().back() = 1;
    auto [gcdval, x, y] = exgcd(modulusExtended, r);
    if (gcdval != 1) {
	// fmt::print("Fuck\n");
	throw 0;
    } else {
	// now we have y * r + x * modulus = 1
	x = signedMod(-x, r);
	y = signedMod(y, modulusExtended);
	return {r, x, y};
    }
}

template <std::size_t B1, std::size_t B2>
BigUInt<B2 - 32> modPowerOf2(BigUInt<B1> v, BigUInt<B2> const& powerOf2)
{
    static_assert(B1 >= B2);
    assert(powerOf2.data().back() == 1);
    BigUInt<B2 - 32> ret{std::move(v).template resizeMove<B2-32>()};
    // for (std::size_t i = 0; i < BigUInt<B2 - 32>::VLEN; ++i) {
    //     ret.data()[i] = v.data()[i];
    // }
    return ret;
}

// v is the value to be processed
// modulus * x = -1(mod R)
template <std::size_t B, typename Multiplier>
BigUInt<B> REDC(BigUInt<2*B> const& v, BigUInt<B+32> const& r,
		BigUInt<B> const& modulus, BigUInt<B+32> const& modulusExtended,
		BigUInt<B> const& x)
{
    Multiplier multiplier;
    BigUInt<B> m = modPowerOf2(multiplier(modPowerOf2(v, r), x), r);
    auto t = ((v.template resize<2*B+32>()
               + multiplier(m, modulus).template resizeMove<2*B+32>())
	      >> B).template resizeMove<B+32>();
    
    
    if (t >= modulusExtended) {
	return (t - modulusExtended).template resizeMove<B>();
    } else {
	return std::move(t).template resizeMove<B>();
    }
}

template <std::size_t B>
struct ContextOfMontgomery
{
    ContextOfMontgomery(BigUInt<B> const& modulus)
    {
	auto tup = findR(modulus.template resize<B + 32>());
	r = std::move(std::get<0>(tup));
	x = BigUInt<B>(std::move(std::get<1>(tup)));
	y = BigUInt<B>(std::move(std::get<2>(tup)));
        rr = modLess(fullMultiply_comba_simd(r, r), modulus);
    }

    // r * y - modulus * x = 1;
    BigUInt<B + 32> r;
    BigUInt<B> rr; // r^2 mod modulus
    BigUInt<B> x;
    BigUInt<B> y;
};

template <std::size_t B, typename Multiplier = Multiplier_normal>
BigUInt<B> modularExp_montgomery(BigUInt<B> const& base, BigUInt<B> const& exp,
				 BigUInt<B> const& modulus, ContextOfMontgomery<B> const& context)
{
    // the highest bit of modulus is 1, which means modulus has exactly B bits.
    // r, x and y are BigUInt<B+32>
    // r*y - modulus*x == 1
    Multiplier multiplier;
    auto modulusExt = modulus.template resize<B+32>();
    // auto [r, x, y] = findR(modulusExt);
    // BigUInt<B> baseMF = modLess(fullMultiply(base, context.r), modulus); // montgomery form of baseMF
    BigUInt<B> baseMF = REDC<B, Multiplier>(multiplier(base, context.rr),
                                            context.r, modulus, modulusExt, context.x);
    // BigUInt<B> dMF = modLess(context.r, modulus); // d is 1, whose mf is 1 * r mod N
    BigUInt<B> dMF = REDC<B, Multiplier>(multiplier(BigUInt<B>(1), context.rr),
                                         context.r, modulus, modulusExt, context.x);
    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
	dMF = REDC<B, Multiplier>(multiplier(dMF, dMF), context.r, modulus, modulusExt, context.x);
	if (*bIter) {
	    dMF = REDC<B, Multiplier>(multiplier(dMF, baseMF), context.r, modulus, modulusExt, context.x);
	}
	--bIter;
    }

    return REDC<B, Multiplier>(dMF.template resize<2*B>(), context.r, modulus, modulusExt, context.x);
}

template <std::size_t B, typename MontMulT>
BigUInt<B> modularExp_montgomery_alter(BigUInt<B> const& base, BigUInt<B> const& exp,
                                       BigUInt<B> const& modulus, ContextOfMontgomery<B> const& context)
{
    MontMulT montMul;
    auto modulusExt = modulus.template resize<B+32>();
    // BigUInt<B> baseMF = modLess(fullMultiply(base, context.r), modulus); // montgomery form of base
    BigUInt<B> baseMF = montMul(base, context.rr, modulus, modulusExt, context);
    // BigUInt<B> dMF = modLess(context.r, modulus); // d is 1, whose mf is 1 * r mod N
    BigUInt<B> dMF = montMul(BigUInt<B>(1), context.rr, modulus, modulusExt, context);
    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
        dMF = montMul(dMF, dMF, modulus, modulusExt, context);
	if (*bIter) {
            dMF = montMul(dMF, baseMF, modulus, modulusExt, context);
	}
	--bIter;
    }

    return montMul(dMF, BigUInt<B>(1), modulus, modulusExt, context);
}


template<std::size_t B>
BigUInt<B> montMul_cios(BigUInt<B> const& a, BigUInt<B> const& b,
                         BigUInt<B> const& modulus, BigUInt<B+32> const& modulusExt,
                         ContextOfMontgomery<B> const& ctx)
{
    const std::size_t nwords = BigUInt<B>::VLEN;
    const uint64_t mask = 0xffffffff;

    std::vector<uint32_t> t(nwords + 2, 0);
    for (std::size_t i = 0; i < nwords; ++i) {
        uint64_t carry = 0;
        uint64_t sum = 0;
        for (std::size_t j = 0; j < nwords; ++j) {
            sum = t[j] + static_cast<uint64_t>(a[j]) * b[i] + carry;
            carry = sum >> 32;
            t[j] = sum;
        }
        sum = static_cast<uint64_t>(t[nwords]) + carry;
        carry = sum >> 32;
        t[nwords] = sum;
        t[nwords + 1] = carry;
        carry = 0;
        
        uint32_t m = t[0] * ctx.x[0]; // mod 2^32
        for (std::size_t j = 0; j < nwords; ++j) {
            sum = t[j] + static_cast<uint64_t>(m) * modulus[j] + carry;
            carry = sum >> 32;
            t[j] = sum;
        }

        sum = static_cast<uint64_t>(t[nwords]) + carry;
        carry = sum >> 32;
        t[nwords] = sum;
        t[nwords + 1] += carry;
        for (std::size_t j = 0; j <= nwords; ++j) {
            t[j] = t[j+1];
        }
    }

    t.pop_back(); // t[0...s+1] to t[0...s]
    BigUInt<B+32> tInt(std::move(t));
    if (tInt >= modulusExt) {
        return tInt - modulusExt;
    } else {
        return std::move(tInt);
    }
}

struct MontMultiplier_cios
{
    template<std::size_t B>
    BigUInt<B> operator()(BigUInt<B> const& a, BigUInt<B> const& b,
                          BigUInt<B> const& modulus, BigUInt<B+32> const& modulusExt,
                          ContextOfMontgomery<B> const& ctx)
    {
        return montMul_cios(a, b, modulus, modulusExt, ctx);
    }
};

inline std::size_t myPow(std::size_t base, std::size_t p)
{
    if (p == 0) return 1;
    if (p == 1) return base;

    auto tmp = myPow(base, p/2);
    if (p % 2 == 0) {
        return tmp * tmp;
    } else {
        return tmp * tmp * base;
    }
}


template<std::size_t B>
struct GNKCtx
{
private:
    static constexpr uint32_t GNKRadix(std::size_t b)
    {
        if (b <= 1024)
            return 29;
        else
            return 28;
    }

    static constexpr uint32_t GNKMask(std::size_t b)
    {
        if (b <= 1024)
            return 0x1fffffff;
        else
            return 0xfffffff;
    }

public:
    static constexpr uint32_t radix = GNKRadix(B);
    static constexpr uint32_t mask = GNKMask(B);
    // the first digit of x, where r*y - modulus*x = 1
    // 32 bit is enough because radix is less than 32
    uint32_t x0;

    // montgomery parameter r = 2^(k*radix)
    // in which k = ceil(B/radix)
    // rr = r^2 mod modulus
    BigUInt<B> rr;
    
    GNKCtx(BigUInt<B> const& modulus);
};

struct RedundantForm
{
    uint64_t first;
    // meet the alignment requirement of AVX2
    std::vector<uint64_t,
                boost::alignment::aligned_allocator<uint64_t, 32>> rest;
    std::size_t size;

    uint64_t& operator[](std::size_t idx) {
        if (idx == 0) return first;
        else return rest[idx - 1];
    }

    uint64_t operator[](std::size_t idx) const {
        if (idx == 0) return first;
        else return rest[idx - 1];
    }

    // constructor
    RedundantForm(std::size_t sz)
        : first(0), rest((sz-1+3)/4*4, 0), size(sz)
    {}

    RedundantForm()
        : first(0), rest(0, 0), size(1)
    {}
};

inline void printRedundantForm(RedundantForm const& rf)
{
    for (std::size_t idx = rf.size; idx > 0; --idx) {
        fmt::print("{:x}|", rf[idx - 1]);
    }
    fmt::print("\n");
}

template<std::size_t B>
RedundantForm toRedundantForm(BigUInt<B> const& orig, uint32_t radix, uint32_t mask);

inline void normalizeRedundantForm(RedundantForm& rf, uint32_t radix, uint32_t mask)
{
    // BigUInt<128> tmp = 0;
    uint64_t tmp = 0;
    tmp += rf.first;
    rf.first = tmp & mask;
    tmp >>= radix;
    for (std::size_t i = 0; i < rf.size - 1; ++i) {
        tmp += rf.rest[i];
        rf.rest[i] = tmp & mask;
        tmp >>= radix;
    }
    assert(tmp == 0);
}

template<std::size_t B>
BigUInt<B> redundantFormToBase32(RedundantForm const& rf, uint32_t radix);

template<std::size_t B>
RedundantForm montMul_GNK(RedundantForm& lhs, RedundantForm& rhs,
                                  RedundantForm& modulus, GNKCtx<B> const& ctx)
{
    constexpr std::size_t origLen = (B + GNKCtx<B>::radix - 1) / GNKCtx<B>::radix;
    constexpr std::size_t vecLen = ((origLen-1) + 3) / 4;
    constexpr std::size_t len = vecLen * 4 + 1;
    
    std::size_t addLimit = myPow(2, 64 - 2 * GNKCtx<B>::radix);
    std::size_t addCounter = 0;
    // lhs.resize(len, 0);
    // modulus.resize(len, 0);
    __m256i lhsVec[vecLen];
    __m256i modVec[vecLen];
    __m256i resVec[vecLen];
    RedundantForm result(lhs.size);
    uint64_t lhs0 = lhs.first;
    uint64_t mod0 = modulus.first;
    uint64_t x0 = ctx.x0 & ctx.mask; // y*r-x*modulus=1

    for (std::size_t i = 0; i < vecLen; ++i) {
        lhsVec[i] = _mm256_load_si256(reinterpret_cast<__m256i*>(lhs.rest.data() + 4 * i));
    }
    for (std::size_t i = 0; i < vecLen; ++i) {
        modVec[i] = _mm256_load_si256(reinterpret_cast<__m256i*>(modulus.rest.data() + 4 * i));
    }
    
    for (std::size_t i = 0; i < origLen; ++i) {
        result.first += lhs0 * rhs[i];
        __m256i b = _mm256_set1_epi64x(rhs[i]);
        for (std::size_t j = 0; j < vecLen; ++j) {
            resVec[j] = _mm256_load_si256(reinterpret_cast<__m256i*>(result.rest.data() + 4*j));
            resVec[j] = _mm256_add_epi64(resVec[j], _mm256_mul_epu32(b, lhsVec[j]));
        }

        uint64_t m = ((result.first & GNKCtx<B>::mask) * x0) & GNKCtx<B>::mask;
        result.first += m * mod0;
        b = _mm256_set1_epi64x(m);
        for (std::size_t j = 0; j < vecLen; ++j) {
            resVec[j] = _mm256_add_epi64(resVec[j], _mm256_mul_epu32(b, modVec[j]));
            _mm256_store_si256(reinterpret_cast<__m256i*>(result.rest.data() + 4*j), resVec[j]);
        }

        result.first >>= GNKCtx<B>::radix;
        result.first += result.rest[0];
        
        for (std::size_t j = 1; j < len-1; ++j) {
            result.rest[j-1] = result.rest[j];
        }
        result.rest[len-2] = 0;

        addCounter += 2;
        if (addCounter >= addLimit) {
            // result.resize(origLen);
            normalizeRedundantForm(result, GNKCtx<B>::radix, GNKCtx<B>::mask);
            // result.resize(len,0);
            addCounter = 0;
        }
    }
    normalizeRedundantForm(result, GNKCtx<B>::radix, GNKCtx<B>::mask);
    return result;
}

template<std::size_t B>
BigUInt<B> modularExp_GNK(BigUInt<B> const& base, BigUInt<B> const& exp,
                          BigUInt<B> const& modulus, GNKCtx<B> const& ctx)
{
    uint32_t radix = GNKCtx<B>::radix;
    RedundantForm baseRF = toRedundantForm(base, GNKCtx<B>::radix, GNKCtx<B>::mask); // base in redundant form
    RedundantForm modulusRF = toRedundantForm(modulus, GNKCtx<B>::radix, GNKCtx<B>::mask);
    RedundantForm rrRF = toRedundantForm(ctx.rr, GNKCtx<B>::radix, GNKCtx<B>::mask); // 2^(2*k*radix) mod m in rf
    // printRedundantForm(baseRF); printRedundantForm(modulusRF);
    // printRedundantForm(rrRF); fmt::print("rr:{}\n", ctx.rr.toDec());

    RedundantForm one(baseRF.size);
    one.first = 1;
    RedundantForm resultRFMF = montMul_GNK(one, rrRF, modulusRF, ctx); // montgomery form
    RedundantForm baseRFMF = montMul_GNK(baseRF, rrRF, modulusRF, ctx); // montgomery form

    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
        resultRFMF = montMul_GNK(resultRFMF, resultRFMF, modulusRF, ctx); // square. maybe optimized later
	if (*bIter) {
            resultRFMF = montMul_GNK(resultRFMF, baseRFMF, modulusRF, ctx);
	}
	--bIter;
    }
    // convert from montgomery form to the original form
    resultRFMF = montMul_GNK(resultRFMF, one, modulusRF, ctx);
    return redundantFormToBase32<B>(resultRFMF, GNKCtx<B>::radix);
}

template<std::size_t B>
BigUInt<B> modularExp_GNK_w4(BigUInt<B> const& base, BigUInt<B> const& exp,
                          BigUInt<B> const& modulus, GNKCtx<B> const& ctx)
{
    // sliding window of size 4
    uint32_t radix = GNKCtx<B>::radix;
    RedundantForm baseRF = toRedundantForm(base, GNKCtx<B>::radix, GNKCtx<B>::mask); // base in redundant form
    RedundantForm modulusRF = toRedundantForm(modulus, GNKCtx<B>::radix, GNKCtx<B>::mask);
    RedundantForm rrRF = toRedundantForm(ctx.rr, GNKCtx<B>::radix, GNKCtx<B>::mask); // 2^(2*k*radix) mod m in rf
    // printRedundantForm(baseRF); printRedundantForm(modulusRF);
    // printRedundantForm(rrRF); fmt::print("rr:{}\n", ctx.rr.toDec());

    RedundantForm one(baseRF.size);
    one.first = 1;
    // RedundantForm resultRFMF = montMul_GNK(one, rrRF, modulusRF, ctx); // montgomery form
    RedundantForm baseRFMF = montMul_GNK(baseRF, rrRF, modulusRF, ctx); // montgomery form

    std::array<RedundantForm, 16> table;
    table[0] = montMul_GNK(one, rrRF, modulusRF, ctx);;
    table[1] = baseRFMF;
    for (std::size_t i = 1; i < 8; ++i) {
        table[2*i] = montMul_GNK(table[i], table[i], modulusRF, ctx);
        table[2*i + 1] = montMul_GNK(table[2*i], baseRFMF, modulusRF, ctx);
    }
    std::array<uint8_t, 8 * BigUInt<B>::VLEN> windows;
    for (int i = BigUInt<B>::VLEN - 1, j = 0; i >= 0; --i, j += 8) {
        windows[j] = (exp[i] >> 28) & 0xf;
        windows[j+1] = (exp[i] >> 24) & 0xf;
        windows[j+2] = (exp[i] >> 20) & 0xf;
        windows[j+3] = (exp[i] >> 16) & 0xf;
        windows[j+4] = (exp[i] >> 12) & 0xf;
        windows[j+5] = (exp[i] >> 8) & 0xf;
        windows[j+6] = (exp[i] >> 4) & 0xf;
        windows[j+7] = (exp[i]) & 0xf;
    }
    RedundantForm result = table[windows[0]];
    for (std::size_t i = 1; i < windows.size(); ++i) {
        result = montMul_GNK(result, result, modulusRF, ctx);
        result = montMul_GNK(result, result, modulusRF, ctx);
        result = montMul_GNK(result, result, modulusRF, ctx);
        result = montMul_GNK(result, result, modulusRF, ctx);

        result = montMul_GNK(result, table[windows[i]], modulusRF, ctx);
    }
    // convert from montgomery form to original form
    result = montMul_GNK(result, one, modulusRF, ctx);
    return redundantFormToBase32<B>(result, GNKCtx<B>::radix);
}

template<std::size_t B>
BigUInt<B> modularExp_GNK_monLadder(BigUInt<B> const& base, BigUInt<B> const& exp,
                          BigUInt<B> const& modulus, GNKCtx<B> const& ctx)
{
    uint32_t radix = GNKCtx<B>::radix;
    RedundantForm baseRF = toRedundantForm(base, GNKCtx<B>::radix, GNKCtx<B>::mask); // base in redundant form
    RedundantForm modulusRF = toRedundantForm(modulus, GNKCtx<B>::radix, GNKCtx<B>::mask);
    RedundantForm rrRF = toRedundantForm(ctx.rr, GNKCtx<B>::radix, GNKCtx<B>::mask); // 2^(2*k*radix) mod m in rf
    // printRedundantForm(baseRF); printRedundantForm(modulusRF);
    // printRedundantForm(rrRF); fmt::print("rr:{}\n", ctx.rr.toDec());

    RedundantForm one(baseRF.size);
    one.first = 1;
    RedundantForm baseRFMF = montMul_GNK(baseRF, rrRF, modulusRF, ctx); // montgomery form
    
    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    auto x1 = baseRFMF;
    auto x2 = montMul_GNK(baseRFMF, baseRFMF, modulusRF, ctx);
    --bIter;
    while (bIter != end) {
	if (*bIter) {
            x1 = montMul_GNK(x1, x2, modulusRF, ctx);
            x2 = montMul_GNK(x2, x2, modulusRF, ctx);
	} else {
            x2 = montMul_GNK(x1, x2, modulusRF, ctx);
            x1 = montMul_GNK(x1, x1, modulusRF, ctx);
        }
	--bIter;
    }
    // convert from montgomery form to the original form
    return redundantFormToBase32<B>(
        montMul_GNK(x1, one, modulusRF, ctx), GNKCtx<B>::radix);
}

template<std::size_t B>
GNKCtx<B>::GNKCtx(BigUInt<B> const& modulus)
{
    auto len = (B + radix - 1) / radix; // ceil(B/radix)
    auto diff = len * radix - B; // ceil(B/radix)*radix - B
    BigUInt<B+32> r;
    r.data().back() = 1 << diff;

    rr = modLess(fullMultiply_comba_simd(r, r), modulus);

    uint32_t y = 1;
    uint32_t z = 2;
    uint32_t msk = 3; // 0b11
    uint32_t m0 = modulus[0];
    for (int i = 2; i <= 32; ++i) {
        if (((m0 * y) & msk) < z) {
            // do nothing
        } else {
            y += z;
        }
        z *= 2;
        msk = (msk << 1) + 1;
    }
    x0 = -y;
    
//     auto [gcdv, x, y] = exgcd(modulus.template resize<B+32>(), r);
//     x = signedMod(-x, r); // y*r - x*modulus == 1
// //  y = signedMod(y, modulus.template resize<B+32>());
    
//     x0 = x[0];
// //    assert(fullMultiply(y, r) - fullMultiply(x, modulus.template resize<B+32>()) == 1);
}

template<std::size_t B>
RedundantForm toRedundantForm(BigUInt<B> const& orig, uint32_t radix, uint32_t mask)
{
    auto len = (B + radix - 1) / radix;
    RedundantForm rf(len);
    std::size_t origIdx = 0;
    std::size_t bitUsed = 0;
    for (std::size_t i = 0; i < len; ++i) {
        auto bitLeft = 32 - bitUsed;
        rf[i] = (orig[origIdx] >> bitUsed) & mask;
        if (bitLeft > radix) {
            bitUsed += radix;
        } else {
            ++origIdx;
            if (origIdx >= BigUInt<B>::VLEN) break;
            auto more = radix - bitLeft;
            rf[i] |= (orig[origIdx] << bitLeft) & mask;
            bitUsed = more;
        }
    }

    return rf;
}


template<std::size_t B>
BigUInt<B> redundantFormToBase32(RedundantForm const& rf, uint32_t radix)
{
    // assume that rf is normalized
    assert((B + radix - 1) / radix == rf.size);
    BigUInt<B> ret;
    std::size_t rfIdx = 0;
    std::size_t bitUsed = 0;
    uint64_t m = 0xffffffff;
    for (std::size_t i = 0; i < BigUInt<B>::VLEN; ++i) {
        auto need = sizeof(typename BigUInt<B>::inner_type) * 8;
        auto bitLeft = radix - bitUsed;
        ret[i] = (rf[rfIdx] >> bitUsed) & m;        
        ++rfIdx;
        if (rfIdx >= rf.size) break;
        need -= bitLeft;
        if (need >= radix) {
            ret[i] |= (rf[rfIdx] << (32 - need)) & m;
            need -= radix;
            ++rfIdx;
            if (rfIdx >= rf.size) break;
            if (need > 0) {
                ret[i] |= (rf[rfIdx] << (32 - need)) & m;
                bitUsed = need;
            } else {
                bitUsed = 0;
            }
        } else {
            // need < radix;
            ret[i] |= (rf[rfIdx] << (32 - need)) & m;
            bitUsed = need;
        }       
    }

    return ret;
}


template<std::size_t B>
bool millerRabin_witness(const BigUInt<B>& a, const BigUInt<B>& n,
			 GNKCtx<B> const& context)
{
    BigUInt<B> m = n - 1;
    int t = 0;
    BitIterator<BigUInt<B>> iter{m, 0};
    BitIterator<BigUInt<B>> end = BitIterator<BigUInt<B>>::end();
    while (iter != end && !(*iter)) {
	++t;
	++iter;
    }
    BigUInt<B> u = m >> t;
    BigUInt<2*B> x0 = modularExp_GNK_w4(a, u, n, context).extend();
    BigUInt<2*B> exN = n.extend();
    BigUInt<2*B> one{ 1 };
    BigUInt<2*B> exM = m.extend();

    for (int i = 1; i <= t; ++i) {
	auto x1 = (x0 * x0) % exN;
	if (x1 == one && (x0 != one && x0 != exM)) {
	    return true;
	}
	x0 = x1;
    }
    if (x0 != one) {
	return true;
    }
    return false;
}

// return true if n is composite
template<std::size_t B>
bool millerRabin(BigUInt<B> const& n)
{
    GNKCtx<B> context(n);
    for (int i = 1; i <= 20; ++i) {
    	auto a = Random<BigUInt<B>>()(1, n-1);
    	if (millerRabin_witness(a, n, context))
    	    return true;
    }
    return false;
}


template<size_t B>
BigUInt<B> signedMod(BigUInt<B> a, BigUInt<B> const& n)
{
    if (a.negative()) {
	do {
	    a += n;
	} while (a.negative());
    }
    
    a %= n;
    return a;
}

template<size_t Bits>
bool modInverse(BigUInt<Bits> const& a, BigUInt<Bits> const& n, BigUInt<Bits>& result)
{
    auto tup = exgcd(a.template resize<Bits+32>(), n.template resize<Bits+32>());
    if (std::get<0>(tup) != 1) {
	return false;
    }

    result = signedMod(std::move(std::get<1>(tup)),
		       n.template resize<Bits+32>())
	.template resize<Bits>();
    return true;
}

template <typename Int>
size_t significantBits(Int v)
{ 
    BitIterator<Int> iter(v, 8 * sizeof(Int) - 1);
    auto end = BitIterator<Int>::beforeBegin();
    size_t zeroCnt = 0;
    while (iter != end) {
	if (!*iter) {
	    ++zeroCnt;
	} else {
	    return 8 * sizeof(Int) - zeroCnt;
	}
	--iter;
    }

    // all zero
    assert(v == 0);
    return 1;
}

template <std::size_t B>
size_t significantBits(BigUInt<B> const& v)
{
    for (int i = BigUInt<B>::VLEN - 1; i >= 0; --i) {
	if (v.data()[i] != 0) {
	    size_t s = significantBits(v.data()[i]);
	    return s + 8 * sizeof(typename BigUInt<B>::inner_type) * i;
	}
    }

    return 1;
}

#endif // NTALGO_HPP_
