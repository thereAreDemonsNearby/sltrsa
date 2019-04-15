#include <fmt/printf.h>
#include "../primegen.hpp"
#include "../TimerGuard.h"
#include "../ntalgo.hpp"

template<size_t Bits>
BigUInt<Bits> inverse(BigUInt<Bits> const& a, BigUInt<Bits> const& n)
{
    auto tup = exgcd(a, n);
    if (std::get<0>(tup) != 1) {
	throw 0;
    }

    return std::get<1>(tup);
}

template <size_t Bits>
bool modInverse_improved(BigUInt<Bits> const& a, BigUInt<Bits> const& n, BigUInt<Bits>& result)
{
    auto tup = exgcd(a.template resize<Bits+32>(), n.template resize<Bits+32>());
    if (std::get<0>(tup) != 1)
	return false;
    result = signedMod(std::move(std::get<1>(tup)),
		       n.template resize<Bits+32>())
	.template resize<Bits>();
    return true;
}

int main()
{
    for (int loop = 0; loop < 10; ++loop) {

	constexpr size_t PrimeBits = 1024;
	// auto p = BigUInt<PrimeBits>::fromDec("156438476661925929496549780403847914979842492913697639668531986415571503225141624286496415050296236850945313573489036717993832590312846700417648128907187799354771311294912479843159975963393680467193637769149664854718409181658782252311622644208018575735324031488830450898307091968791259459416908083908088391507").resize<2*PrimeBits>();
	// auto q = BigUInt<PrimeBits>::fromDec("137605767683233055540204339779738209462443663372171279212768524691741833765283207648911766448024610802951568347013744595878681389680246832550399862976302488060495121605137121500931618065229287506560303459744485091821477557486609618941975122231746901252768217626057667965754233975094446845571303224004947730081").resize<2*PrimeBits>();    
	auto p = primeGen_par<PrimeBits>(6).resize<2*PrimeBits>();
	auto q = primeGen_par<PrimeBits>(6).resize<2*PrimeBits>();
	auto n = p * q;
	BigUInt<2 * PrimeBits> e = 65537;
	auto phiN = (p - 1) * (q - 1);

	{
	    TimerGuard tg("inverse: ");
	    auto d = inverse(e, phiN);
	    if (d.negative()) {
		fmt::print("d is negative.\n");
		d = signedMod(d, phiN);
		auto b = fullMultiply(e, d) % phiN.resize<4*PrimeBits>();
		fmt::print("b={0}\n", b.toDec());
	    }
	}

	{
	    TimerGuard tg("modInverse:");
	    BigUInt<2*PrimeBits> d;
	    if (modInverse(e, phiN, d) == true) {
		auto b = fullMultiply(e, d) % phiN.resize<4*PrimeBits>();
		fmt::print("b={0}\n", b.toDec());
	    } else {
		fmt::print("failed\n");
	    }
	}

	{
	    TimerGuard tg("modInverse_improved");
	    BigUInt<2*PrimeBits> d;
	    if (modInverse_improved(e, phiN, d)) {
		auto b = fullMultiply(e, d) % phiN.resize<4*PrimeBits>();
		fmt::print("b={0}\n", b.toDec());
	    } else {
		fmt::print("failed\n");
	    }
	}
    
    }
}
