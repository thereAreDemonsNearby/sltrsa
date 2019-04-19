#include "../biguint.hpp"
#include "../fullMultiply_alter.hpp"
#include "../TimerGuard.h"

// #define TestBitLength // given in compiler option

void correctness()
{
    const size_t B = 2048;
    // MulCtx_normal_multithrd pool(4);
    for (int i = 0; i < 1000; ++i) {
        auto a = BigUInt<B>::randomGen();
        auto b = BigUInt<B>::randomGen();
        auto res1 = fullMultiply(a, b);
        auto res2 = fullMultiply_comba_simd_finer(a, b);
        if (res1 != res2) {
            fmt::print("not equal\n");
            std::exit(1);
        }
    }
}

int main()
{
    // correctness();
    constexpr std::size_t B = TestBitLength;
    constexpr std::size_t LOOP = 10000;
    fmt::print("Bit length: {0} "
               "Mul times: {1}\n", B, LOOP);
    std::vector<BigUInt<B>> vec;
    for (int i = 0; i < LOOP+1; ++i) {
        vec.push_back(BigUInt<B>::randomGen());
    }
    std::vector<BigUInt<B+B>> rv1, rv2, rv3;
    rv1.reserve(vec.size()-1);
    rv2.reserve(vec.size()-1);
    rv3.reserve(vec.size()-1);
    
    {
        TimerGuard tg("normal:");
        for (int i = 0; i < vec.size()-1; ++i) {
            auto res = fullMultiply(vec[i], vec[i+1]);
            // rv1.emplace_back(std::move(res));
        }
    }

    {
        TimerGuard tg("normal simd:");
        for (int i = 0; i < vec.size()-1; ++i) {
            auto res = fullMultiply_simd(vec[i], vec[i+1]);
            // rv1.emplace_back(std::move(res));
        }
    }

    // for (int cores = 2; cores <= 6; ++cores)
    // {
    //     auto msg = fmt::format("normal multithread with {} cores:", cores);
    //     MulCtx_normal_multithrd ctx(cores);
    //     {
    //         TimerGuard tg(msg);
    //         for (int i = 0; i < vec.size() - 1; ++i) {
    //             auto res = fullMultiply_multithrd_spin(vec[i], vec[i+1], ctx);
    //         }
    //     }
    // }

    {
        TimerGuard tg("comba: ");
        for (int i = 0; i < vec.size()-1; ++i) {
            auto res = fullMultiply_comba(vec[i], vec[i+1]);
        }
    }

    {
        TimerGuard tg("comba simd: ");
        for (int i = 0; i < vec.size()-1; ++i) {
            auto res = fullMultiply_comba_simd(vec[i], vec[i+1]);
        }
    }

    {
        TimerGuard tg("comba simd finer: ");
        for (int i = 0; i < vec.size()-1; ++i) {
            auto res = fullMultiply_comba_simd_finer(vec[i], vec[i+1]);
        }
    }

    
    // possible deadlock and not fast
    // {
    //     FixedSpinTaskPool pool(4);
    //     TimerGuard tg("normal with multithread(2): ");
    //     for (int i = 0; i < vec.size() - 1; ++i) {
    //         auto res = fullMultiply_multithrd_spin2(vec[i], vec[i+1], pool);
    //     }
    // }

    // to slow to deserve a test
    // {
    //     TimerGuard tg("comba openmp: ");
    //     for (int i = 0; i < vec.size()-1; ++i) {
    //         auto res = fullMultiply_comba_openmp(vec[i], vec[i+1]);
    //     }
    // }
}
