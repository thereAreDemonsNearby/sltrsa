#include "../TimerGuard.h"
#include "../primegen.hpp"
#include <fmt/format.h>
#include <string>

template <std::size_t B>
void genPrime(int loops, int tnmax = 6)
{   
    {
        std::string msg =
            fmt::format("bitlen:{0}, loops:{1}, serial", B, loops);
        TimerGuard tg(msg);
        for (int i = 0; i < loops; ++i) {
            auto prime = primeGen_serial<B>();
        }
    }

    for (int t = 2; t <= tnmax; ++t)
    {
        std::string msg =
            fmt::format("bitlen:{0}, loops:{1}, par, threadnum:{2}", B, loops, t);
        TimerGuard tg(msg);
        for (int i = 0; i < loops; ++i) {
            auto prime = primeGen_par<B>(t);
        }
    }
}

int main()
{
    genPrime<512>(100);
    genPrime<1024>(100);
    genPrime<2048>(50);
    genPrime<4096>(10);
}
