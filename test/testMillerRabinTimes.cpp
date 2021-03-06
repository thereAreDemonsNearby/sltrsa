#include <fmt/format.h>
#include "../ntalgo.hpp"

template<std::size_t B>
bool millerRabin_forTest(BigUInt<B> const& n, int& times)
{
    ContextOfMontgomery<B> context(n);
    int i;
    for (i = 1; i <= 20; ++i) {
    	auto a = Random<BigUInt<B>>()(1, n-1);
    	if (millerRabin_witness(a, n, context)) {
            times = i;
    	    return true;
        }
    }
    times = 20;
    return false;
}

int main()
{
    constexpr std::size_t B = TestBitLength;
    constexpr std::size_t T = 10000;

    // fmt::print("test {0} numbers of {1} bits:\n", T, B);
    for (int i = 0; i < T; ++i) {
        int t;
        auto beg = BigUInt<B>::randomGenFullBitsOdd();
        // if (millerRabin_forTest(beg, t)) {
        //     // composite
        //     fmt::print("millerRabin_witness ran for {0} times\n", t);
        // } else {
        //     fmt::print("prime(20)\n");
        // }
        millerRabin_forTest(beg, t);
        fmt::print("{}\n", t);       
    }
}
