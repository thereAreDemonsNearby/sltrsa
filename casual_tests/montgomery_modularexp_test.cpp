#include <fmt/format.h>
#include "../ntalgo.hpp"
#include "../TimerGuard.h"

// return: tuple of (R, modulus', R')
// in which R*R' - modulus*modulus' == 1
// and R' is in [0, modulus-1], modulus' is in [0, R-1]
// modulusExtended has 1 higher byte of 0


template <std::size_t B>
BigUInt<B> modularMult(BigUInt<B> const& a, BigUInt<B> const& b, BigUInt<B> const& n)
{
    auto [r, x, y] = findR(n);
    fmt::print("x: {}\n", x.toDec());
    fmt::print("r: {}\n", r.toDec());
    BigUInt<B> aMF = modLess(fullMultiply(a, r), n);
    fmt::print("aMF: {}\n", aMF.toDec());
    BigUInt<B> bMF = modLess(fullMultiply(b, r), n);
    fmt::print("bMF: {}\n", bMF.toDec());
    BigUInt<B> iMF = REDC(fullMultiply(aMF, bMF), r, n, x);
    fmt::print("intermediate result: {}\n", iMF.toDec());

    BigUInt<B> result = REDC(iMF.template resize<2*B>(), r, n, x);
    fmt::print("result: {}\n", result.toDec());
    return result;
}

int main()
{
    constexpr std::size_t B = 1024;
    // for (int i = 0; i < 10000; ++i) {
    // 	auto modulus = BigUInt<B>::randomGenFullBitsOdd();
    // 	auto tup = findR(modulus);
    // 	//fmt::print("r is {}\n", std::get<0>(tup).toBitString());
    // }
    
    for (int i = 0; i < 100; ++i) {
	fmt::print("i = {}\n", i);
	auto base = BigUInt<B>::randomGen();
	auto exp = BigUInt<B>::randomGen();
	auto modulus = BigUInt<B>::randomGenOdd();
	// auto base = BigUInt<B>{3};
	// auto exp = BigUInt<B>{3};
	// auto modulus = BigUInt<B>{3};
	BigUInt<B> res1, res2;
	{
	    TimerGuard tg("normal modular exp:");
	    res1 = modularExp(base, exp, modulus);
	}

	{
	    TimerGuard tg("montgomery modular exp:");
	    res2 = modularExp_montgomery(base, exp, modulus);
	}

	if (res1 != res2) {
	    fmt::print("incorrect result.\nres1 = {0},\nres2 = {1}\n", res1.toDec(), res2.toDec());
	    std::exit(1);
	}
    }
    
//    modularMult(BigUInt<32>{5}, BigUInt<32>{7}, BigUInt<32>{9});
}
