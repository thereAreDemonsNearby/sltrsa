#include <iostream>
#include "../primegen.hpp"
#include "../TimerGuard.h"
#include "../ntalgo.hpp"

int main()
{
    constexpr int threadNum = 12;
    constexpr size_t PrimeBits = 1024;
    
    auto r = BigUInt<PrimeBits>::randomGenFullBitsOdd();

    BigUInt<PrimeBits> res1, res2;
    {
	TimerGuard tg("concurrency prime detect:");
	res1 = primeGen_par(r, threadNum);
    }

    {
	TimerGuard tg("serial prime detect:");
	res2 = primeGen_serial(r);
    }    
}
