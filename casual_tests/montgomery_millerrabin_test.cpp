#include <fmt/format.h>
#include "../TimerGuard.h"
#include "../ntalgo.hpp"

template<std::size_t B>
bool millerRabin_witness_1(const BigUInt<B>& a, const BigUInt<B>& n)
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
    BigUInt<2*B> x0 = modularExp_montgomery(a, u, n).extend();
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

template <std::size_t B>
bool millerRabin_witness_montgomery(BigUInt<B> const& a, BigUInt<B> const& b)
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
}
