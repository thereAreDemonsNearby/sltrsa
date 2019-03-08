#ifndef PRIMEGEN_H__
#define PRIMEGEN_H__

#include <thread>
#include <atomic>
#include <mutex>
#include <iostream>
#include <functional>

#include "ntalgo.hpp"
#include "TimerGuard.h"

#include "smallprimes.h"

template<size_t Bits>
BigUInt<Bits> primeGen_par(int threadNum);

template<size_t Bits>
BigUInt<Bits> primeGen_par(BigUInt<Bits> beginning, int threadNum);

template<size_t Bits>
BigUInt<Bits> primeGen_serial(BigUInt<Bits> beginning);

template<size_t Bits>
bool preTest(const BigUInt<Bits>& n)
{
    for (int i = 0; i < 10000; ++i) {
	auto copy = n;
	if (copy.divideU32(smallPrimes[i]) == 0) {
	    return false;
	}
    }

    return true;
}

template<size_t Bits>
bool isComposite_par(const BigUInt<Bits>& n, int threadNum)
{
    if (!preTest(n))
	return true;

    return millerRabin_par(n, threadNum);
}

template<size_t Bits>
bool isComposite_serial(const BigUInt<Bits>& n)
{
    if (!preTest(n))
	return true;

    return millerRabin(n);
}

template<size_t Bits>
void primeDetectThread(BigUInt<Bits> beginning, int limit,
		       bool& genDone, std::mutex& mut,
		       BigUInt<Bits>& out, int threadNum)
{
    for (int i = 0; i < limit; ++i) {
	
	{
	    std::lock_guard<std::mutex> guard(mut);
	    if (genDone) {
		return;
	    }
	}

	bool isPrime = !isComposite_par(beginning, threadNum);
	if (isPrime) {
	    std::lock_guard<std::mutex> guard(mut);
	    genDone = true;
	    out = beginning;
	    return;
	} else {
	    beginning += 2;
	}
    }
}

template<size_t Bits>
BigUInt<Bits> primeGen_par(int threadNum)
{
    return primeGen_par(BigUInt<Bits>::randomGenFullBitsOdd(), threadNum);
}

template<size_t Bits>
BigUInt<Bits> primeGen_par(BigUInt<Bits> beginning, int threadNum)
{
    constexpr int workload = 25;
    
    bool genDone = false;
    std::mutex mut;
    BigUInt<Bits> result;
    
    while (!genDone) {
	std::vector<std::thread> threads(threadNum);
	for (auto& thrd : threads) {
	    thrd = std::thread(primeDetectThread<Bits>, beginning, workload,
			       std::ref(genDone), std::ref(mut), std::ref(result),
			       threadNum);
	    beginning += workload * 2;
	}
	for (auto& thrd : threads) {
	    thrd.join();
	}
    }

    return result;
}

template<size_t Bits>
BigUInt<Bits> primeGen_serial(BigUInt<Bits> beginning)
{
    while (isComposite_serial(beginning)) {
	beginning += 2;
    }
    return beginning;
}


#endif
