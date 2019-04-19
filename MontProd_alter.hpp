#include "ntalgo.hpp"

template <std::size_t B, typename MontProdT>
BigUInt<B> modularExp_montgomery_alter(BigUInt<B> const& base, BigUInt<B> const& exp,
                                       BigUInt<B> const& modulus, ContextOfMontgomery<B> const& context)
{
    MontProdT montProd;   
    auto modulusExt = modulus.template resize<B+32>();
    BigUInt<B> baseMF = modLess(fullMultiply(base, context.r), modulus); // montgomery form of base
    BigUInt<B> dMF = modLess(context.r, modulus); // d is 1, whose mf is 1 * r mod N
    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
        dMF = montProd(dMF, dMF, modulus, modulusExt, context);
	if (*bIter) {
            dMF = montProd(dMF, baseMF, modulus, modulusExt, context);
	}
	--bIter;
    }

    return montProd(dMF, BigUInt<B>(1), modulus, modulusExt, context);
}


template<std::size_t B>
BigUInt<B> montProd_cios(BigUInt<B> const& a, BigUInt<B> const& b,
                         BigUInt<B> const& modulus, BigUInt<B+32> const& modulusExt,
                         ContextOfMontgomery<B> const& ctx)
{
    const std::size_t nwords = BigUInt<B>::VLEN;
    const uint64_t mask = 0xffffffff;

    std::vector<uint32_t> t(nwords + 2, 0);
    for (std::size_t i = 0; i < nwords; ++i) {
        uint64_t carry = 0;
        uint64_t sum = 0;
        for (std::size_t j = 0; j < nwords; ++j) {
            sum = t[j] + static_cast<uint64_t>(a[j]) * b[i] + carry;
            carry = sum >> 32;
            t[j] = sum;
        }
        sum = static_cast<uint64_t>(t[nwords]) + carry;
        carry = sum >> 32;
        t[nwords] = sum;
        t[nwords + 1] = carry;
        carry = 0;
        
        uint32_t m = t[0] * ctx.x[0]; // mod 2^32
        for (std::size_t j = 0; j < nwords; ++j) {
            sum = t[j] + static_cast<uint64_t>(m) * modulus[j] + carry;
            carry = sum >> 32;
            t[j] = sum;
        }

        sum = static_cast<uint64_t>(t[nwords]) + carry;
        carry = sum >> 32;
        t[nwords] = sum;
        t[nwords + 1] += carry;
        for (std::size_t j = 0; j <= nwords; ++j) {
            t[j] = t[j+1];
        }
    }

    t.pop_back(); // t[0...s+1] to t[0...s]
    BigUInt<B+32> tInt(std::move(t));
    if (tInt >= modulusExt) {
        return tInt - modulusExt;
    } else {
        return std::move(tInt);
    }
}

struct MontProder_cios
{
    template<std::size_t B>
    BigUInt<B> operator()(BigUInt<B> const& a, BigUInt<B> const& b,
                          BigUInt<B> const& modulus, BigUInt<B+32> const& modulusExt,
                          ContextOfMontgomery<B> const& ctx)
    {
        return montProd_cios(a, b, modulus, modulusExt, ctx);
    }
};
