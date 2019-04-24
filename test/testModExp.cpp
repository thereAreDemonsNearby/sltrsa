#include <fmt/format.h>
#include "../ntalgo.hpp"
#include "../MontMul_alter.hpp"
#include "../TimerGuard.h"
#include "../primegen.hpp"

template<std::size_t B>
void test()
{
    BigUInt<B> n = fullMultiply_comba_simd(primeGen_par<B/2>(6), primeGen_par<B/2>(6));
    BigUInt<B> base = BigUInt<B>::randomGen();
    BigUInt<B> exp = BigUInt<B>::randomGen();
    fmt::print("1s in exp:{}\n", count1(exp));
    ContextOfMontgomery<B> montCtx(n);
    BigUInt<B> res1, res2;
    
    {
        TimerGuard tg("modexp normal:");
        for (int i = 0; i < 100; ++i)
            res1 = modularExp_montgomery(base, exp, n, montCtx);
    }

    {
        TimerGuard tg("modexp normal comba avx");
        for (int i = 0; i < 100; ++i)
            modularExp_montgomery<B, Multiplier_comba_simd>(base, exp, n, montCtx);
    }

    {
        TimerGuard tg("modexp cios:");
        for (int i = 0; i < 100; ++i)
            res2 = modularExp_montgomery_alter<B, MontMultiplier_cios>(base, exp, n, montCtx);
    }

    // if (res1 != res2) {
    //     fmt::print("error.\n{0}\n{1}\n", res1.toDec(), res2.toDec());
    // }
}

int main()
{
    test<1024>();
    test<2048>();
}
