#ifndef PRIMEGEN_H__
#define PRIMEGEN_H__

#include <thread>
#include <atomic>
#include <mutex>
#include <condition_variable>
#include <iostream>
#include <functional>

#include "ntalgo.hpp"
#include "TimerGuard.h"

#include "smallprimes.h"

template<std::size_t B>
bool millerRabin_par(BigUInt<B> const& n, int threadNum,
                     bool& likely, std::mutex& mut_likely, std::condition_variable& cv_likely)
{
    ContextOfMontgomery<B> context(n);
    auto a = Random<BigUInt<B>>()(1, n-1);
    if (millerRabin_witness(a, n, context))
	return true;

    struct LikelyGuard
    {
        bool& likely;
        std::mutex& mut_likely;
        std::condition_variable& cv_likely;
        LikelyGuard(bool& b, std::mutex& m,
                    std::condition_variable& cv)
            : likely(b), mut_likely(m), cv_likely(cv) {}
        ~LikelyGuard() {
            std::unique_lock lck(mut_likely);
            likely = false;
            lck.unlock();
            cv_likely.notify_all();
        }
    };
    
    {
        std::unique_lock<std::mutex> lck(mut_likely);
        likely = true;
    }
    LikelyGuard likelyGd(likely, mut_likely, cv_likely);
    
    std::atomic_bool composite(false);
    auto thrdFunc = [&composite, &n, &context](int loop) {
        for (int i = 0; i < loop; ++i) {
            if (composite == true) {
                return;
            }
            auto a = Random<BigUInt<B>>()(1, n-1);
            if (millerRabin_witness(a, n, context)) {
                composite = true;
                return;
            }
        }
    };

    std::vector<std::thread> threads(threadNum);
    int tasksPerThread = 19 / threadNum;
    int remainedTasks = 19 % threadNum;
    
    for (auto& thrd : threads) {
	thrd = std::thread(thrdFunc, tasksPerThread);
    }
    if (remainedTasks > 0) {
	std::thread(thrdFunc, remainedTasks).join();
    }
    for (auto& thrd : threads) {
	thrd.join();
    }

    return composite;
}

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
bool isComposite_par(const BigUInt<Bits>& n, int threadNum,
                     bool& likely, std::mutex& mut_likely, std::condition_variable& cv_likely)
{
    if (!preTest(n))
	return true;

    return millerRabin_par(n, threadNum,
                           likely, mut_likely, cv_likely);
    // return millerRabin(n);
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
		       bool& genDone, std::mutex& mut_genDone,
                       bool& likely,  std::mutex& mut_likely, std::condition_variable& cv_likely,
		       BigUInt<Bits>& out, int threadNum)
{
    for (int i = 0; i < limit; ++i) {
        {
            std::unique_lock<std::mutex> guard(mut_likely);
            cv_likely.wait(guard, [&likely](){ return !likely; });
        }
	
	{
	    std::lock_guard<std::mutex> guard(mut_genDone);
	    if (genDone) {
		return;
	    }
	}

	bool isPrime = !isComposite_par(beginning, threadNum,
                                        likely, mut_likely, cv_likely);
	if (isPrime) {
	    std::lock_guard<std::mutex> guard(mut_genDone);
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
    std::mutex mut_genDone;
    
    bool likely = false;
    std::mutex mut_likely;
    std::condition_variable cv_likely;
    
    BigUInt<Bits> result;
    
    while (!genDone) {
	std::vector<std::thread> threads(threadNum);
	for (auto& thrd : threads) {
	    thrd = std::thread(primeDetectThread<Bits>, beginning, workload,
			       std::ref(genDone), std::ref(mut_genDone),
                               std::ref(likely), std::ref(mut_likely), std::ref(cv_likely),
                               std::ref(result), threadNum);
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

template<size_t Bits>
BigUInt<Bits> primeGen_serial()
{
    return primeGen_serial(BigUInt<Bits>::randomGenFullBitsOdd());
}

#endif
