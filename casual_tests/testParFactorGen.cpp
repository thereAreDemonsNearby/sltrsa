#include <future>
#include <vector>
#include <array>
#include "../TimerGuard.h"
#include "../ntalgo.hpp"

constexpr size_t Bits = 4096;

std::vector<BigUInt<Bits>> serial(BigUInt<Bits> const& a, BigUInt<Bits> const& n)
{
    std::vector<BigUInt<Bits>> vec(Bits/2);
    auto factor = a;
    for (size_t i = 0; i != Bits/2; ++i) {
	vec[i] = factor;
	factor = factor * factor % n;
    }

    return vec;
}

std::vector<BigUInt<Bits>> parallel(BigUInt<Bits> const& a, BigUInt<Bits> const& n)
{
    std::vector<BigUInt<Bits>> vec(Bits/2);
    vec[0] = a;
    vec[1] = vec[0] * vec[0] % n;
    vec[2] = vec[1] * vec[1] % n;
    vec[3] = vec[2] * vec[2] % n;

    std::array<std::future<void>, 4> arr;
    for (size_t i = 0; i != 4; ++i) {
	arr[i] = std::async([&vec, &n, i](){
				for (size_t j = i + 4; j < Bits/2; j += 4) {
				    auto tmp = vec[j - 4] * vec[j - 4] % n;
				    tmp = tmp * tmp % n;
				    tmp = tmp * tmp % n;
				    vec[j] = tmp * tmp % n;
				}
			    });
    }

    for (auto& fut : arr) {
	fut.wait();
    }

    return vec;
}

int main()
{
    constexpr size_t PrimeBits = 1024;
    auto p = BigUInt<PrimeBits>::fromDec("156438476661925929496549780403847914979842492913697639668531986415571503225141624286496415050296236850945313573489036717993832590312846700417648128907187799354771311294912479843159975963393680467193637769149664854718409181658782252311622644208018575735324031488830450898307091968791259459416908083908088391507").resize<2*PrimeBits>();
    auto q = BigUInt<PrimeBits>::fromDec("137605767683233055540204339779738209462443663372171279212768524691741833765283207648911766448024610802951568347013744595878681389680246832550399862976302488060495121605137121500931618065229287506560303459744485091821477557486609618941975122231746901252768217626057667965754233975094446845571303224004947730081").resize<2*PrimeBits>();
    auto n = p * q;

    for (int i = 0; i < 100; ++i) {
	auto text = BigUInt<2*PrimeBits>::randomGen().resize<Bits>();
	std::vector<BigUInt<Bits>> res1, res2;	
	{
	    TimerGuard tg("serial:");
	    res1 = serial(text, n.resize<Bits>());
	}

	{
	    TimerGuard tg("parallel:");
	    res2 = parallel(text, n.resize<Bits>());
	}

	if (res1 != res2) {
	    std::cout << "Unequal\n";
	    throw 0;
	}
    }
}
