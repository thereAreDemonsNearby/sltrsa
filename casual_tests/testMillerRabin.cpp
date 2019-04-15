#include <iostream>

#include "../biguint.hpp"
#include "../ntalgo.hpp"
#include "../smallprimes.h"
#include "../TimerGuard.h"

constexpr size_t PrimeBits = 1024;

bool preTest(const BigUInt<PrimeBits>& n)
{
    for (int i = 0; i < 10000; ++i) {
	auto copy = n;
	if (copy.divideU32(smallPrimes[i]) == 0) {
	    return false;
	}
    }

    return true;
}

bool primeTest(const BigUInt<PrimeBits>& n)
{
    if (!preTest(n))
	return false;

    bool isComposite = true;

    {
	TimerGuard tg("Time used for serial miller-rabin:");
	isComposite = millerRabin(n);     
    }

    {
	TimerGuard tg("Time used for hybrid miller-rabin:");
	if (isComposite != millerRabin_par(n, 4)) { std::cerr << "error\n"; };
    }
    std::cout << "\n";    
    return !isComposite;
}

BigUInt<PrimeBits> primeGen(int* testFreq = nullptr)
{
    auto r = BigUInt<PrimeBits>::randomGenOdd();
    while (r.data().back() == 0) {
	r = BigUInt<PrimeBits>::randomGenOdd();
    }
    if (testFreq)
	*testFreq = 1;
    while (!primeTest(r)) {
	std::cout << "now testFreq is " << *testFreq << "\n";
	r += 2;
	if (testFreq)
	    *testFreq += 1;
    }
    return r;
}

int main()
{
    int testFreq = 0;
    auto prime = primeGen(&testFreq);
    std::cout << prime.toU32() << " times of prime test: " << testFreq << std::endl;    
}
