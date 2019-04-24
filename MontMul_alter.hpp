#include <x86instrin.h>
#include "ntalgo.hpp"

template <std::size_t B, typename MontMulT>
BigUInt<B> modularExp_montgomery_alter(BigUInt<B> const& base, BigUInt<B> const& exp,
                                       BigUInt<B> const& modulus, ContextOfMontgomery<B> const& context)
{
    MontMulT montMul;
    auto modulusExt = modulus.template resize<B+32>();
    BigUInt<B> baseMF = modLess(fullMultiply(base, context.r), modulus); // montgomery form of base
    BigUInt<B> dMF = modLess(context.r, modulus); // d is 1, whose mf is 1 * r mod N
    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
        dMF = montMul(dMF, dMF, modulus, modulusExt, context);
	if (*bIter) {
            dMF = montMul(dMF, baseMF, modulus, modulusExt, context);
	}
	--bIter;
    }

    return montMul(dMF, BigUInt<B>(1), modulus, modulusExt, context);
}


template<std::size_t B>
BigUInt<B> montMul_cios(BigUInt<B> const& a, BigUInt<B> const& b,
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

struct MontMultiplier_cios
{
    template<std::size_t B>
    BigUInt<B> operator()(BigUInt<B> const& a, BigUInt<B> const& b,
                          BigUInt<B> const& modulus, BigUInt<B+32> const& modulusExt,
                          ContextOfMontgomery<B> const& ctx)
    {
        return montMul_cios(a, b, modulus, modulusExt, ctx);
    }
};

template<std::size_t B>
struct GNKCtx
{
    uint32_t radix;
    uint32_t mask;
    // the first digit of x, where r*y - modulus*x = 1
    // 32 bit is enough because radix is less than 32
    uint32_t x0;

    // montgomery parameter r = 2^(k*radix)
    // in which k = ceil(B/radix)
    // rr = r^2 mod modulus
    BigUInt<B> rr;

    GNKCtx(BigUInt<B> const& modulus);
};

template<std::size_t B>
std::vector<uint64_t> toRedundantForm(BigUInt<B> const& orig, uint32_t radix, uint32_t mask);

inline void normalizeRedundantForm(std::vector<uint64_t> const& rf, uint32_t radix, uint32_t mask)
{
    uint64_t tmp = 0;
    for (std::size_t i = 0; i < rf.size(); ++i) {
        tmp += rf[i];
        rf[i] = tmp & mask;
        tmp >>= radix;
    }
    assert(tmp == 0);
}

template<std::size_t B>
BigUInt<B> redundantFormToBase32(std::vector<uint64_t> const& rf, uint32_t radix);

template<std::size_t B>
std::vector<uint64_t> montMul_GNK(std::vector<uint64_t> const& lhs, std::vector<uint64_t> const& rhs,
                                  GNKCtx<B> const& ctx)
{
    
}

template<std::size_t B>
BigUInt<B> modularExp_GNK(BigUInt<B> const& base, BigUInt<B> const& exp,
                          BigUInt<B> const& modulus, GNKCtx<B> const& ctx)
{
    uint32_t radix = ctx.radix();
    std::vector<uint64_t> baseRF = toRedundantForm(base, ctx.radix, ctx.mask); // base in redundant form
    std::vector<uint64_t> modulusRF = toRedundantForm(modulus, ctx.radix, ctx.mask);
    std::vector<uint64_t> rrRF = toRedundantForm(ctx.rr, ctx.radix, ctx.mask); // 2^(2*k*radix) mod m in rf

    std::vector<uint64_t> one(baseRF.size(), 0);
    one[0] = 1;
    std::vector<uint64_t> resultRFMF = montMul_GNK(one, rrRF, ctx); // montgomery form
    std::vector<uint64_t> baseRFMF(baseRF, rrRF); // montgomery form

    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
        resultRFMF = montMul_GNK(resultRFMF, resultRFMF, ctx); // square. maybe optimized later
	if (*bIter) {
            resultRFMF = montMul_GNK(resultRFMF, baseRFMF, ctx);
	}
	--bIter;
    }

    // convert from montgomery form to the original form
    resultRFMF = montMul_GNK(resultRFMF, one, ctx);
    return redundantFormToBase32(resultRFMF, ctx.radix, ctx.mask);
}

template<std::size_t B>
GNKCtx<B>::GNKCtx(BigUInt<B> const& modulus)
{
    if (B <= 1024) {
        radix = 29;
        mask = 0x1fffffff;
    } else {
        radix = 28;
        mask = 0xfffffff; // 7*f
    }

    auto len = (B + radix) / radix; // ceil(B/radix)
    auto diff = len * radix - B; // ceil(B/radix)*radix - B
    BigUInt<B+32> r;
    r.data().back() = 1 << diff;

    rr = modLess(fullMultiply_comba_simd(r, r), modulus);

    auto [gcdv, x, y] = exgcd(modulus.template resize<B+32>(), r);
    x = signedMod(-x, r); // y*r - x*modulus == 1
    
    x0 = x[0];
}

template<std::size_t B>
std::vector<uint64_t> toRedundantForm(BigUInt<B> const& orig, uint32_t radix, uint32_t mask)
{
    auto len = (B + radix) / radix;
    std:: vector<uint64_t> rf(len, 0);
    std::size_t origIdx = 0;
    std::size_t bitUsed = 0;
    for (std::size_t i = 0; i < len; ++i) {
        auto bitLeft = 32 - bitUsed;
        rf[i] = (orig[origIdx] >> bitUsed) & mask;
        if (bitLeft > radix) {
            bitUsed += radix;
        } else {
            ++origIdx;
            auto more = radix - bitLeft;
            rf[i] |= (orig[origIdx] << bitLeft) & mask;
            bitUsed = more;
        }
    }

    return rf;
}


template<std::size_t B>
BigUInt<B> redundantFormToBase32(std::vector<uint64_t> const& rf, uint32_t radix)
{
    // assume that rf is normalized
    assert((B+radix)/radix == rf.size());
    BigUInt<B> ret;
    std::size_t rfIdx = 0;
    std::size_t bitUsed = 0;
    uint64_t m = 0xffffffff;
    for (std::size_t i = 0; i < BigUInt<B>::VLEN; ++i) {
        auto need = sizeof(typename BigUInt<B>::inner_type) * 8;
        auto bitLeft = radix - bitUsed;
        ret[i] = (rf[rfIdx] >> bitUsed) & m;        
        ++rfIdx;
        need -= bitLeft;
        if (need >= radix) {
            ret[i] |= (rf[rfIdx] << (32 - need)) & m;
            need -= radix;
            ++rfIdx;
            if (need > 0) {
                ret[i] |= (rf[rfIdx] << (32 - need)) & m;
                bitUsed = need;
            } else {
                bitUsed = 0;
            }
        } else {
            // need < radix;
            ret[i] |= (rf[rfIdx] << (32 - need)) & m;
            bitUsed = need;
        }       
    }

    return ret;
}
