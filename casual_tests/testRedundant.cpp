#include <fmt/format.h>
#include "../ntalgo.hpp"

void test0()
{
    BigUInt<256> a = BigUInt<256>::fromHex("fa5401a8593c981bfd42a2802a750928e930850d63bc2c5fda8d4ca9655091ad");
    fmt::print("a is \n{}\n", a.toHex());
    RedundantForm rf = toRedundantForm(a, 29, 0x1fffffff);
    fmt::print("redundant form is \n");
    printRedundantForm(rf);
    fmt::print("\n");

    BigUInt<256> b = redundantFormToBase32<256>(rf, 29);
    fmt::print("b is {}\n", b.toHex());

    for (int i = 0; i < 10000; ++i) {
        BigUInt<1024> v = BigUInt<1024>::randomGen();
        BigUInt<1024> v2 = redundantFormToBase32<1024>(toRedundantForm(v,28,0x1fffffff), 28);
        if (v != v2) {
            fmt::print(stderr, "error\n");
            std::exit(1);
        }
    }

    for (int i = 0; i < 100; ++i) {
        GNKCtx<1024> ctx(BigUInt<1024>::randomGenOdd());
    }
}

template <std::size_t B>
void testAndCompare()
{
    auto modulus = BigUInt<B>::randomGenOdd();    
    ContextOfMontgomery<B> mctx(modulus);
    GNKCtx<B> gkctx(modulus);
    auto base = BigUInt<B>::randomGen();
    auto exp = BigUInt<B>::randomGen();
    // auto exp = BigUInt<B>{65537};
    fmt::print("B={}\n", B);
    BigUInt<B> res1, res2, res3;
    {
        TimerGuard tg("normal");
//        for (int i = 0; i < 100; ++i)
            modularExp_montgomery(base, exp, modulus, mctx);
    }
    {
        TimerGuard tg("comba simd");
        // for (int i = 0; i < 100; ++i)
        modularExp_montgomery<B, Multiplier_comba_simd>(base, exp, modulus, mctx);
    }
    {
        TimerGuard tg("cios");
        //              for (int i = 0; i < 100; ++i)
        modularExp_montgomery_alter<B, MontMultiplier_cios>(base, exp, modulus, mctx);
    }
    {
        TimerGuard tg("gnk");
        //      for (int i = 0; i < 100; ++i)
        modularExp_GNK(base, exp, modulus, gkctx);
    }
    {
        TimerGuard tg("gnk mon ladder");
        //      for (int i = 0; i < 100; ++i)
        modularExp_GNK_monLadder(base, exp, modulus, gkctx);
    }

    {
        TimerGuard tg("gnk w4");
        //      for (int i = 0; i < 100; ++i)
        modularExp_GNK_w4(base, exp, modulus, gkctx);
    }
}

int main()
{
    testAndCompare<512>();
    testAndCompare<1024>();
    testAndCompare<2048>();
    testAndCompare<4096>();
}

// g++ -O2 -std=c++17 -mavx2 -lfmt -o testRedundant testRedundant.cpp ../fullMultiply_alter.cpp 
