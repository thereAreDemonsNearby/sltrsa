#ifndef NTALGO_HPP_
#define NTALGO_HPP_
#include <utility>
#include <type_traits>
#include <iterator>
#include <random>
#include <tuple>
#include <thread>
#include <atomic>
#include "biguint.hpp"

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
    BitIterator& operator++() {	++offset; }
    BitIterator& operator--() {	--offset; }
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


// ax = b (mod n)
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

// a ^ b mod n
// template<typename Integer>
// Integer modularExp(const Integer& a, const Integer& b, const Integer& n)
// {
// 	Integer d{1};
// 	BitIterator<Integer> bIter{b, Width<Integer>()() - 1};
// 	auto end = BitIterator<Integer>::beforeBegin();
// 	while (bIter != end) {
// 		d = (d * d) % n;
// 		if (*bIter) { // bi == 1
// 			d = (d * a) % n;
// 		}
// 		--bIter;
// 	}
// 	return d;
// }

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
    while (bIter != end) {
	d = (d * d) % exN;
	if (*bIter) {
	    d = (d * exA) % exN;
	}
	--bIter;
    }
    return d.trunc();
}

// use a to test if n is prime
// return true if n is composite. a^(n-1) = 1(mod n)
// template<typename Integer>
// bool millerRabin_witness(const Integer& a, const Integer& n)
// {
// 	Integer one{1};
// 	Integer m = n - one;
// 	int t = 0;
// 	BitIterator<Integer> iter{m, 0};
// 	BitIterator<Integer> end = BitIterator<Integer>::end();
// 	while (iter != end && !(*iter)) {
// 		++t;
// 		++iter;
// 	}		
// 	Integer u = m >> t;
// 	Integer x0 = modularExp(a, u, n);
// 	for (int i = 1; i <= t; ++i) {
// 		auto x1 = (x0 * x0) % n;
// 		if (x1 == one && (x0 != one && x0 != m)) {
// 			return true;
// 		}
// 		x0 = x1;
// 	}
// 	if (x0 != one) {
// 		return true;
// 	}
// 	return false;
// }

template<std::size_t B>
bool millerRabin_witness(const BigUInt<B>& a,const BigUInt<B>& n)
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
    BigUInt<2*B> x0 = modularExp(a, u, n).extend();
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
template<typename Integer>
bool millerRabin(const Integer& n)
{
    for (int i = 1; i <= 50; ++i) {
    	auto a = Random<Integer>()(1, n-1);
    	if (millerRabin_witness(a, n))
    	    return true;
    }
    return false;
}

template<typename Integer>
bool millerRabin2(const Integer& n, int times)
{
    std::atomic_bool composite(false);
    auto thrdFunc = [&composite, &n]() {
			for (int i = 1; i < 5; ++i) {
			    if (composite == true) {
				return;
			    }
			    auto a = Random<Integer>()(1, n-1);
			    if (millerRabin_witness(a, n)) {
				composite = true;
				return;
			    }
			} 
		    };

    std::thread threads[4];
    for (auto& thrd : threads) {
	thrd = std::thread(thrdFunc);
    }

    for (auto& thrd : threads) {
	thrd.join();
    }

    return composite;
}

template<typename Integer>
bool millerRabin_par(const Integer& n, int threadNum)
{
    auto a = Random<Integer>()(1, n-1);
    if (millerRabin_witness(a, n))
	return true;
    
    std::atomic_bool composite(false);
    auto thrdFunc = [&composite, &n](int loop) {
			for (int i = 0; i < loop; ++i) {
			    if (composite == true) {
				return;
			    }
			    auto a = Random<Integer>()(1, n-1);
			    if (millerRabin_witness(a, n)) {
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
    auto tup = exgcd(a.template resize<2*Bits>(), n.template resize<2*Bits>());
    if (std::get<0>(tup) != 1) {
	return false;
    }

    result = signedMod(std::move(std::get<1>(tup)),
		       n.template resize<2*Bits>())
	.template resize<Bits>();
    return true;
}

#endif // NTALGO_HPP_
