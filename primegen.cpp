#include <thread>
#include <atomic>
#include <mutex>
#include <iostream>
#include <functional>

#include "primegen.h"
#include "ntalgo.hpp"
#include "TimerGuard.h"

#include "smallprimes.h"

// template<typename Integer>
// bool isComposite(Integer const& n)
// {
//     auto a = Random<Integer>()(1, n-1);
//     if (millerRabin_witness(a, n))
// 	return true;
    
//     std::atomic_bool composite(false);
//     auto thrdFunc = [&composite, &n](int loop) {
// 			for (int i = 0; i < loop; ++i) {
// 			    if (composite == true) {
// 				return;
// 			    }
// 			    auto a = Random<Integer>()(1, n-1);
// 			    if (millerRabin_witness(a, n)) {
// 				composite = true;
// 				return;
// 			    }
// 			}
// 		    };

//     std::thread threads[4];
//     for (size_t i = 0; i != 3; ++i) {
// 	threads[i] = std::thread(thrdFunc, 5);
//     }
//     threads[3] = std::thread(thrdFunc, 4);

//     for (auto& thrd : threads) {
// 	thrd.join();
//     }

//     return composite;
// }


// returns false if n is composite
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

bool isComposite(const BigUInt<PrimeBits>& n)
{
    if (!preTest(n))
	return true;

    return millerRabin3(n, 20);
}

void primeDetectThread(BigUInt<PrimeBits> beginning, int limit,
		       bool& genDone, std::mutex& mut,
		       BigUInt<PrimeBits>& out)
{
    for (int i = 0; i < limit; ++i) {
	
	{
	    std::lock_guard<std::mutex> guard(mut);
	    if (genDone) {
		return;
	    }
	}

	bool isPrime = !isComposite(beginning);
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

BigUInt<PrimeBits> primeGen(BigUInt<PrimeBits> beginning)
{
    constexpr int workload = 25;
    
    bool genDone = false;
    std::mutex mut;
    BigUInt<PrimeBits> result;
    
    while (!genDone) {
	std::thread threads[4];
	for (auto& thrd : threads) {
	    thrd = std::thread(primeDetectThread, beginning, workload,
			       std::ref(genDone), std::ref(mut), std::ref(result));
	    beginning += workload * 2;
	}
	for (auto& thrd : threads) {
	    thrd.join();
	}
    }

    return result;
}

BigUInt<PrimeBits> primeGen_serial(BigUInt<PrimeBits> beginning)
{
    while (isComposite(beginning)) {
	beginning += 2;
    }
    return beginning;
}
