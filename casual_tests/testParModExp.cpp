#include <iostream>
#include <future>
#include "../biguint.hpp"
#include "../TimerGuard.h"
#include "../ntalgo.hpp"
#include "../primegen.hpp"

constexpr size_t PrimeBits = 1024;

template<size_t B, size_t ExpB>
BigUInt<B> modularExp1(const BigUInt<B>& a, const BigUInt<ExpB>& b, const BigUInt<B>& n)
{
    const size_t ExB = 2 * B;
    BigUInt<ExB> d{1};
    BigUInt<ExB> exA = a.extend();
    BigUInt<ExB> exN = n.extend();
    BitIterator<BigUInt<ExpB>>
	bIter{b, ExpB - 1};
    auto end = BitIterator<typename std::decay<decltype(b)>::type>::beforeBegin();
    while (!*bIter) {
	--bIter;
    }
    
    while (bIter != end) {
	d = (d * d) % exN;
	if (*bIter) {
	    d = (d * exA) % exN;
	}
	--bIter;
    }
    return d.template resize<B>();
}

template<std::size_t B>
BigUInt<B> modularExp_reverse(const BigUInt<B>& a, const BigUInt<B>& b, const BigUInt<B>& n)
{
    constexpr std::size_t ExB = 2 * B;
    
    BigUInt<ExB> res = 1;
    BigUInt<ExB> exN = n.template resize<ExB>();
    BitIterator<BigUInt<B>> bIter(b, 0);
    auto end = BitIterator<BigUInt<B>>::end();

    auto factor = a.template resize<ExB>();
    while (bIter != end) {
	if (*bIter) {
	    res = (res * factor) % exN;
	}
	factor = (factor * factor) % exN;
	++bIter;
    }
    return res.template resize<B>();
}

template<std::size_t CipherChunkBits>
BigUInt<CipherChunkBits> modularExp_chineseRemainder(
    BigUInt<CipherChunkBits> const& cipher, BigUInt<CipherChunkBits/2> const& p,
    BigUInt<CipherChunkBits/2> const& q, BigUInt<CipherChunkBits/2> const& pInv,
    BigUInt<CipherChunkBits/2> const& qInv, BigUInt<CipherChunkBits> const& d,
    BigUInt<CipherChunkBits> const& n)
{   
    auto cipher1 = modLess(cipher, p);
    auto cipher2 = modLess(cipher, q);
    auto d1 = modLess(d, p - 1);
    auto d2 = modLess(d, q - 1);

    auto m1 = modularExp1(cipher1, d1, p);
    auto m2 = modularExp1(cipher2, d2, q);

    auto exN = n.template resize<CipherChunkBits*2>();
    auto m = fullMultiply(fullMultiply(m1, q), qInv.template resize<CipherChunkBits>())
	+ fullMultiply(fullMultiply(m2, p), pInv.template resize<CipherChunkBits>());
    m = m % exN;
    return m.template resize<CipherChunkBits>();
}

template<std::size_t CipherChunkBits>
BigUInt<CipherChunkBits> modularExp_chineseRemainder_par(
    BigUInt<CipherChunkBits> const& cipher, BigUInt<CipherChunkBits/2> const& p,
    BigUInt<CipherChunkBits/2> const& q, BigUInt<CipherChunkBits/2> const& pInv,
    BigUInt<CipherChunkBits/2> const& qInv, BigUInt<CipherChunkBits> const& d,
    BigUInt<CipherChunkBits> const& n)
{
    std::future<BigUInt<CipherChunkBits/2>>
    fut1 = std::async([&](){
			  auto cipher1 = modLess(cipher, p);
			  auto d1 = modLess(d, p - 1);
			  return modularExp1(cipher1, d1, p);
		      }),
    fut2 = std::async([&](){
			  auto cipher2 = modLess(cipher, q);
			  auto d2 = modLess(d, q - 1);
			  return modularExp1(cipher2, d2, q);			  
		      });

    auto m1 = fut1.get();
    auto m2 = fut2.get();

    auto exN = n.template resize<CipherChunkBits*2>();
    auto m = fullMultiply(fullMultiply(m1, q), qInv.template resize<CipherChunkBits>())
	+ fullMultiply(fullMultiply(m2, p), pInv.template resize<CipherChunkBits>());
    m = m % exN;
    return m.template resize<CipherChunkBits>();
}

int main()
{   
    BigUInt<PrimeBits> p, q;
    {
	TimerGuard tg("key gen:");
	p = primeGen_par<PrimeBits>(4);
	q = primeGen_par<PrimeBits>(4);
    }
    auto pInv = modInverse(p, q);
    auto qInv = modInverse(q, p);
    auto n = fullMultiply(p, q);
    BigUInt<2 * PrimeBits> e = 65537;
    auto phiN = fullMultiply(p - 1, q - 1);
    auto d = modInverse(e, phiN);
    std::cout << "1: " << (fullMultiply(e, d) % phiN.extend()).toDec() << '\n';
    std::cout << "1: " << (fullMultiply(p, pInv) % q.extend()).toDec() << '\n';
    std::cout << "1: " << (fullMultiply(q, qInv) % p.extend()).toDec() << '\n'; /// here is the problem
    for (int i = 0; i != 100; ++i) {
	auto cipherText = BigUInt<2*PrimeBits>::randomGen();
	BigUInt<2*PrimeBits> res1, res2, res3, res4;
	
	{
	    TimerGuard tg("modexp1:");
	    res1 = modularExp1(cipherText, d, n);
	}

	{
	    TimerGuard tg("modexp_reverse:");
	    res2 = modularExp_reverse(cipherText, d, n);
	}

	{
	    TimerGuard tg("modexp_chineseremainder");
	    res3 = modularExp_chineseRemainder(cipherText, p, q, pInv, qInv, d, n);
	}

	{
	    TimerGuard tg("modexp_chineseremainder_par");
	    res4 = modularExp_chineseRemainder_par(cipherText, p, q, pInv, qInv, d, n);
	}

	if (res1 != res2) {
	    std::cout << "not equal 1 2" << std::endl;
	    return 1;
	}

	if (res1 != res3) {
	    std::cout << "not equal 1 3" << std::endl;
	    std::cout << "1: " << res1.toDec() << "\n3: " << res3.toDec() << std::endl;
	    return 2;
	}

	if (res1 != res4) {
	    std::cout << "not equal 1 4" << std::endl;
	    std::cout << "1: " << res1.toDec() << "\n4: " << res4.toDec() << std::endl;
	    return 2;
	}

	std::cout << '\n';
    }
}
