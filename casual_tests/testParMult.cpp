#include "../TimerGuard.h"
#include "../fullMultiply_par.hpp"

#include <fmt/format.h>

// static void test0()
// {
//     BigUInt<128> a = BigUInt<128>::fromHex("00000001""00000002""00000003""00000004");
//     BigUInt<128> b = BigUInt<128>::fromHex("4");
//     std::cout << a.toHex() << "\n" << b.toHex() << std::endl;
//     auto res1 = fullMultiply(a, b);
//     auto res2 = fullMultiply_simd(a, b);
//     std::cout << res1.toHex() << "\n" << res2.toHex() << std::endl;
// }

// static void test1()
// {
//     constexpr std::size_t B = 2048;
//     for (int i = 0; i < 100; ++i) {
//         auto a = BigUInt<B>::randomGen();
//         auto b = BigUInt<B>::randomGen();
//         BigUInt<B+B> res1, res2, res3;
//         {
//             TimerGuard tg("serial:");
//             res1 = fullMultiply(a, b);
//         }

//         FixedMulPool pool(4);
//         {
//             TimerGuard tg("multithread:");
//             res3 = fullMultiply_multithrd(a, b, pool);
//         }

//         if (res1 != res3) {
//             std::cout << res1.toDec() << "\n" << res3.toDec() << "\nfailed(13).\n";
//             std::exit(2);
//         } else {
//             std::cout << "ok\n";
//         }
//     }
// }


// static void test3()
// {
//     constexpr std::size_t B = 256;
//     std::vector<BigUInt<B>> vec(1000);
//     std::vector<BigUInt<B+B>> resVec1, resVec2;
//     for (auto& e : vec)
//         e = BigUInt<B>::randomGen();
//     {
//         TimerGuard tg("serial: ");        
//         for (int i = 0; i < vec.size() - 1; ++i) {
//             auto res = fullMultiply(vec[i], vec[i+1]);
//             // resVec1.push_back(res);
//         }
//     }

//     {
//         TimerGuard tg("simd: ");
//         for (int i = 0; i < vec.size() - 1; ++i) {
//             auto res = fullMultiply_simd(vec[i], vec[i+1]);
//             // resVec2.push_back(res);
//         }
//     }

//     if (resVec1 != resVec2) {
//         std::cout << "gg\n";
//     }
// }

static void test4()
{
    constexpr std::size_t B = 2048;
    std::vector<BigUInt<B>> vec(100000);
    std::vector<BigUInt<B+B>> resVec1, resVec2;
    for (auto& e : vec)
        e = BigUInt<B>::randomGen();
    
    {
        TimerGuard tg("serial: ");        
        for (int i = 0; i < vec.size() - 1; ++i) {
            auto res = fullMultiply(vec[i], vec[i+1]);
            // resVec1.emplace_back(std::move(res));
        }
    }

    FixedMulPool_noCv pool(4);
    {
        TimerGuard tg("multithread: ");
        for (int i = 0; i < vec.size() - 1; ++i) {
            auto res = fullMultiply_multithrd(vec[i], vec[i+1], pool);
            // resVec2.emplace_back(std::move(res));
        }
    }

    if (resVec1 != resVec2) {
        std::cout << "gg\n";
    }
}

int main()
{
    test4();
    // FixedMulPool pool(6);
    // constexpr std::size_t B = 2048;
    // auto a = BigUInt<B>::randomGen();
    // auto b = BigUInt<B>::randomGen();
    // auto res1 = fullMultiply(a, b);
    // auto res2 = fullMultiply_multithrd(a, b, pool);
    // if (res1 != res2) {
    //     std::cout << res1.toDec() << "\n" << res2.toDec() << std::endl;
    // }
}
