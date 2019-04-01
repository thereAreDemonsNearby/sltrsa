#ifndef MONTGOMERY_MODMUL_HPP
#define MONTGOMERY_MODMUL_HPP

#include "ntalgo.hpp"


template <std::size_t B>
struct ContextOfMontgomery
{
    ContextOfMontgomery(BigUInt<B> const& modulus)
    {
	auto tup = findR(modulus.template resize<B + 32>());
	r = std::move(std::get<0>(tup));
	x = std::move(std::get<1>(tup));
	y = std::move(std::get<2>(tup));
    }

    // r * y - modulus * x = 1;
    BigUInt<B + 32> r;
    BigUInt<B + 32> x;
    BigUInt<B + 32> y;
};

template <std::size_t B>
std::tuple<BigUInt<B>, BigUInt<B>, BigUInt<B>>
findR(BigUInt<B> const& modulusExtended)
{
    // one more word
    BigUInt<B> r{};    
    r.data().back() = 1;
    auto [gcdval, x, y] = exgcd(modulusExtended, r);
    if (gcdval != 1) {
	// fmt::print("Fuck\n");
	throw 0;
    } else {
	// now we have y * r + x * modulus = 1
	x = signedMod(-x, r);
	y = signedMod(y, modulusExtended);
	return {r, x, y};
    }
}

template <std::size_t B1, std::size_t B2>
BigUInt<B2 - 32> modPowerOf2(BigUInt<B1> const& v, BigUInt<B2> const& powerOf2)
{
    static_assert(B1 >= B2);
    assert(powerOf2.data().back() == 1);
    BigUInt<B2 - 32> ret{};
    for (std::size_t i = 0; i < BigUInt<B2 - 32>::VLEN; ++i) {
	ret.data()[i] = v.data()[i];
    }
    return ret;
}

// v is the value to be processed
// modulus * x = -1(modR)
template <std::size_t B>
BigUInt<B> REDC(BigUInt<2*B> const& v, BigUInt<B+32> const& r,
		BigUInt<B+32> const& modulusExtended,
		BigUInt<B+32> const& x)
{
    BigUInt<B> m = modPowerOf2(fullMultiply(modPowerOf2(v, r), x), r);
    auto t = ((v.template resize<2*B+32>()
		+ fullMultiply(m, modulusExtended))
	      >> B).template resize<B+32>();
    
    
    if (t >= modulusExtended) {
	return (t - modulusExtended).template resize<B>();
    } else {
	return t.template resize<B>();
    }
}

template <std::size_t B>
BigUInt<B> modularExp_montgomery(BigUInt<B> const& base, BigUInt<B> const& exp,
				 BigUInt<B> const& modulus, ContextOfMontgomery<B> const& context)
{
    // the highest bit of modulus is 1, which means modulus has exactly B bits.

    // r, x and y are BigUInt<B+32>
    // r*y - modulus*x == 1
    auto modulusExt = modulus.template resize<B+32>();
    // auto [r, x, y] = findR(modulusExt);
    BigUInt<B> baseMF = modLess(fullMultiply(base, context.r), modulus); // montgomery form of base
    BigUInt<B> dMF = modLess(context.r, modulus); // d is 1, whose mf is 1 * r mod N
    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
	dMF = REDC<B>(fullMultiply(dMF, dMF), context.r, modulusExt, context.x);
	if (*bIter) {
	    dMF = REDC<B>(fullMultiply(dMF, baseMF), context.r, modulusExt, context.x);
	}
	--bIter;
    }

    return REDC<B>(dMF.template resize<2*B>(), context.r, modulusExt, context.x);
}


#endif
