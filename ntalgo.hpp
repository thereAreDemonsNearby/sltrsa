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
#include "biguint.hpp"
#include "TimerGuard.h"

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
BigUInt<B2 - 32> modPowerOf2(BigUInt<B1> const& v, BigUInt<B2> const& powerOf2)
{
    static_assert(B1 >= B2);
    assert(powerOf2.data().back() == 1);
    BigUInt<B2 - 32> ret{};
    for (std::size_t i = 0; i < BigUInt<B2 - 32>::VLEN; ++i) {
	ret.data()[i] = v.data()[i];
    }
    return ret;
}

// v is the value to be processed
// modulus * x = -1(modR)
template <std::size_t B>
BigUInt<B> REDC(BigUInt<2*B> const& v, BigUInt<B+32> const& r,
		BigUInt<B> const& modulus, BigUInt<B+32> const& modulusExtended,
		BigUInt<B+32> const& x)
{
    BigUInt<B> m = modPowerOf2(fullMultiply(modPowerOf2(v, r).template resize<B+32>(), x), r);
    auto t = ((v.template resize<2*B+32>()
               + fullMultiply(m, modulus).template resize<2*B+32>())
	      >> B).template resize<B+32>();
    
    
    if (t >= modulusExtended) {
	return (t - modulusExtended).template resize<B>();
    } else {
	return t.template resize<B>();
    }
}

template <std::size_t B>
struct ContextOfMontgomery
{
    ContextOfMontgomery(BigUInt<B> const& modulus)
    {
	auto tup = findR(modulus.template resize<B + 32>());
	r = std::move(std::get<0>(tup));
	x = std::move(std::get<1>(tup));
	y = std::move(std::get<2>(tup));
    }

    // r * y - modulus * x = 1;
    BigUInt<B + 32> r;
    BigUInt<B + 32> x;
    BigUInt<B + 32> y;
};

template <std::size_t B>
BigUInt<B> modularExp_montgomery(BigUInt<B> const& base, BigUInt<B> const& exp,
				 BigUInt<B> const& modulus, ContextOfMontgomery<B> const& context)
{
    // the highest bit of modulus is 1, which means modulus has exactly B bits.

    // r, x and y are BigUInt<B+32>
    // r*y - modulus*x == 1
    auto modulusExt = modulus.template resize<B+32>();
    // auto [r, x, y] = findR(modulusExt);
    BigUInt<B> baseMF = modLess(fullMultiply(base, context.r), modulus); // montgomery form of base
    BigUInt<B> dMF = modLess(context.r, modulus); // d is 1, whose mf is 1 * r mod N
    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
	dMF = REDC<B>(fullMultiply(dMF, dMF), context.r, modulus, modulusExt, context.x);
	if (*bIter) {
	    dMF = REDC<B>(fullMultiply(dMF, baseMF), context.r, modulus, modulusExt, context.x);
	}
	--bIter;
    }

    return REDC<B>(dMF.template resize<2*B>(), context.r, modulus, modulusExt, context.x);
}

template<std::size_t B>
bool millerRabin_witness(const BigUInt<B>& a, const BigUInt<B>& n,
			 ContextOfMontgomery<B> const& context)
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
    BigUInt<2*B> x0 = modularExp_montgomery(a, u, n, context).extend();
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
    ContextOfMontgomery<B> context(n);
    for (int i = 1; i <= 50; ++i) {
    	auto a = Random<BigUInt<B>>()(1, n-1);
    	if (millerRabin_witness(a, n, context))
    	    return true;
    }
    return false;
}

template<std::size_t B>
bool millerRabin_par(BigUInt<B> const& n, int threadNum)
{
    ContextOfMontgomery<B> context(n);
    auto a = Random<BigUInt<B>>()(1, n-1);
    if (millerRabin_witness(a, n, context))
	return true;
    
    std::atomic_bool composite(false);
    auto thrdFunc = [&composite, &n, &context](int loop) {
        for (int i = 0; i < loop; ++i) {
            if (composite == true) {
                return;
            }
            auto a = Random<BigUInt<B>>()(1, n-1);
            if (millerRabin_witness(a, n, context)) {
                composite = true;
                return;
            }
        }
    };

    std::vector<std::thread> threads(threadNum);
    int tasksPerThread = 19 / threadNum;
    int remainedTasks = 19 % threadNum;
    
    for (auto& thrd : threads) {
	thrd = std::thread(thrdFunc, tasksPerThread);
    }
    if (remainedTasks > 0) {
	std::thread(thrdFunc, remainedTasks).join();
    }
    for (auto& thrd : threads) {
	thrd.join();
    }

    return composite;
}

template<size_t B>
BigUInt<B> signedMod(BigUInt<B> a, BigUInt<B> const& n)
{
    if (a.negative()) {
	do {
	    a += n;
	} while (a.negative());
    } else {
	a %= n;
    }
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
