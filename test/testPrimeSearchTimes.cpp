#include "../ntalgo.hpp"
#include <fmt/format.h>
#include <algorithm>
#include "../smallprimes.h"

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
bool isComposite_serial(const BigUInt<Bits>& n)
{
    if (!preTest(n))
	return true;

    return millerRabin(n);
}

template<size_t Bits>
BigUInt<Bits> primeGen_serial_test(int& cnt)    
{
    auto beginning = BigUInt<Bits>::randomGenFullBitsOdd();
    while (isComposite_serial(beginning)) {
	beginning += 2;
        ++cnt;
    }
    return beginning;
}
void printResult(std::vector<int>& vec)
{
    fmt::print("size:{}\n", vec.size());
    std::sort(vec.begin(), vec.end());
    fmt::print("min: {0} max: {1}\n", vec.front(), vec.back());
    auto avg = std::accumulate(vec.begin(), vec.end(), 0)
        / double(vec.size());
    auto mid = vec[vec.size()/2];
    fmt::print("avg: {0} mid: {1}\n", avg, mid);
}

template<size_t Bits>
void test()
{
    std::vector<int> ret;
    for (int i = 0; i < 100; ++i) { 
        int t = 0;
        auto prime = primeGen_serial_test<Bits>(t);
        // fmt::print("i:{0}, t:{1}\n", i, t);
        ret.push_back(t);
    }
    printResult(ret);
}

int main()
{
    test<512>();
    test<1024>();
    test<2048>();
}
