#include <iostream>
#include <fstream>
#include "../ntalgo.hpp"
#include "../TimerGuard.h"
#include 

int main()
{
    auto base = BigUInt<1024>::randomGen();
    auto mod = BigUInt<1024>::randomGen();
    BigUInt<1024> exp = 1;
    std::fstream time1("time1", std::ios::out);
    std::fstream time2("time2", std::ios::out);

    for (int i = 0; i != 100; ++i) {
	BigUInt<1024> a, b;
	{
	    TimerGuard tg("time elapsed: ", time1);
	    a = modularExp(base, exp, mod);	    
	}
	{
	    TimerGuard tg("time elapsed: ", time2);
	    b = modularExp_youhua(base, exp, mod);
	}
	if (a != b) {
	    throw 0;
	}
	exp *= 1000;
    }

    
}
