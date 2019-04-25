#include <x86intrin.h>
#include "ntalgo.hpp"

template <std::size_t B, typename MontMulT>
BigUInt<B> modularExp_montgomery_alter(BigUInt<B> const& base, BigUInt<B> const& exp,
                                       BigUInt<B> const& modulus, ContextOfMontgomery<B> const& context)
{
    MontMulT montMul;
    auto modulusExt = modulus.template resize<B+32>();
    // BigUInt<B> baseMF = modLess(fullMultiply(base, context.r), modulus); // montgomery form of base
    BigUInt<B> baseMF = montMul(base, context.rr, modulus, modulusExt, context);
    // BigUInt<B> dMF = modLess(context.r, modulus); // d is 1, whose mf is 1 * r mod N
    BigUInt<B> dMF = montMul(BigUInt<B>(1), context.rr, modulus, modulusExt, context);
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

std::size_t myPow(std::size_t base, std::size_t p)
{
    if (p == 0) return 1;
    if (p == 1) return base;

    auto tmp = myPow(base, p/2);
    if (p % 2 == 0) {
        return tmp * tmp;
    } else {
        return tmp * tmp * base;
    }
}



template<std::size_t B>
struct GNKCtx
{
private:
    static constexpr uint32_t GNKRadix(std::size_t b)
    {
        if (b < 1024) return 29;
        else return 28;
    }

    static constexpr uint32_t GNKMask(std::size_t b)
    {
        if (b < 1024) return 0x1fffffff;
        else return 0xfffffff;
    }

public:
    static constexpr uint32_t radix = GNKRadix(B);
    static constexpr uint32_t mask = GNKMask(B);
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

inline void normalizeRedundantForm(std::vector<uint64_t>& rf, uint32_t radix, uint32_t mask)
{
    // BigUInt<128> tmp = 0;
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
std::vector<uint64_t> montMul_GNK(std::vector<uint64_t>& lhs, std::vector<uint64_t>& rhs,
                                  std::vector<uint64_t>& modulus, GNKCtx<B> const& ctx)
{
    constexpr std::size_t origLen = (B + GNKCtx<B>::radix - 1) / GNKCtx<B>::radix;
    constexpr std::size_t vecLen = ((origLen-1) + 3) / 4;
    constexpr std::size_t len = vecLen * 4 + 1;
    
    std::size_t addLimit = myPow(2, 64 - 2 * GNKCtx<B>::radix);
    std::size_t addCounter = 0;
    lhs.resize(len, 0);
    modulus.resize(len, 0);
    __m256i lhsVec[vecLen];
    __m256i modVec[vecLen];
    std::vector<uint64_t> result(len, 0);
    uint64_t lhs0 = lhs[0];
    uint64_t mod0 = modulus[0];
    uint64_t x0 = ctx.x0 & ctx.mask; // y*r-x*modulus=1

    for (std::size_t i = 0; i < vecLen; ++i) {
        lhsVec[i] = _mm256_loadu_si256(reinterpret_cast<__m256i*>(lhs.data() + 1 + 4 * i));
    }
    for (std::size_t i = 0; i < vecLen; ++i) {
        modVec[i] = _mm256_loadu_si256(reinterpret_cast<__m256i*>(modulus.data() + 1 + 4 * i));
    }
    
    for (std::size_t i = 0; i < origLen; ++i) {
        result[0] += lhs0 * rhs[i];
        __m256i b = _mm256_set1_epi64x(rhs[i]);
        for (std::size_t j = 0; j < vecLen; ++j) {
            __m256i res = _mm256_loadu_si256(reinterpret_cast<__m256i*>(result.data() + 1 + 4*j));
            res = _mm256_add_epi64(res, _mm256_mul_epu32(b, lhsVec[j]));
            _mm256_storeu_si256(reinterpret_cast<__m256i*>(result.data() + 1 + 4*j), res);
        }

        uint64_t m = ((result[0] & GNKCtx<B>::mask) * x0) & GNKCtx<B>::mask;
        result[0] += m * mod0;
        b = _mm256_set1_epi64x(m);
        for (std::size_t j = 0; j < vecLen; ++j) {
            __m256i res = _mm256_loadu_si256(reinterpret_cast<__m256i*>(result.data() + 1 + 4*j));
            res = _mm256_add_epi64(res, _mm256_mul_epu32(b, modVec[j]));
            _mm256_storeu_si256(reinterpret_cast<__m256i*>(result.data() + 1 + 4*j), res);
        }

        result[0] >>= GNKCtx<B>::radix;
        result[0] += result[1];
        
        for (std::size_t j = 2; j < len; ++j) {
            result[j-1] = result[j];
        }
        result[len-1] = 0;

        addCounter += 2;
        if (addCounter >= addLimit) {
            normalizeRedundantForm(result, GNKCtx<B>::radix, GNKCtx<B>::mask);
            addCounter = 0;
        }
    }

    lhs.resize(origLen);
    modulus.resize(origLen);
    result.resize(origLen);
    normalizeRedundantForm(result, GNKCtx<B>::radix, GNKCtx<B>::mask);
    return result;
}

template<std::size_t B>
BigUInt<B> modularExp_GNK(BigUInt<B> const& base, BigUInt<B> const& exp,
                          BigUInt<B> const& modulus, GNKCtx<B> const& ctx)
{
    uint32_t radix = GNKCtx<B>::radix;
    std::vector<uint64_t> baseRF = toRedundantForm(base, GNKCtx<B>::radix, GNKCtx<B>::mask); // base in redundant form
    std::vector<uint64_t> modulusRF = toRedundantForm(modulus, GNKCtx<B>::radix, GNKCtx<B>::mask);
    std::vector<uint64_t> rrRF = toRedundantForm(ctx.rr, GNKCtx<B>::radix, GNKCtx<B>::mask); // 2^(2*k*radix) mod m in rf

    std::vector<uint64_t> one(baseRF.size(), 0);
    one[0] = 1;
    std::vector<uint64_t> resultRFMF = montMul_GNK(one, rrRF, modulusRF, ctx); // montgomery form
    std::vector<uint64_t> baseRFMF = montMul_GNK(baseRF, rrRF, modulusRF, ctx); // montgomery form

    BitIterator<BigUInt<B>> bIter{exp, BigUInt<B>::BITS - 1};
    auto end = BitIterator<BigUInt<B>>::beforeBegin();
    while (!(*bIter)) {
    	--bIter;
    }
    while (bIter != end) {
        resultRFMF = montMul_GNK(resultRFMF, resultRFMF, modulusRF, ctx); // square. maybe optimized later
	if (*bIter) {
            resultRFMF = montMul_GNK(resultRFMF, baseRFMF, modulusRF, ctx);
	}
	--bIter;
    }

    // convert from montgomery form to the original form
    resultRFMF = montMul_GNK(resultRFMF, one, modulusRF, ctx);
    return redundantFormToBase32<B>(resultRFMF, GNKCtx<B>::radix);
}

template<std::size_t B>
GNKCtx<B>::GNKCtx(BigUInt<B> const& modulus)
{
    auto len = (B + radix - 1) / radix; // ceil(B/radix)
    auto diff = len * radix - B; // ceil(B/radix)*radix - B
    BigUInt<B+32> r;
    r.data().back() = 1 << diff;

    rr = modLess(fullMultiply_comba_simd(r, r), modulus);

    auto [gcdv, x, y] = exgcd(modulus.template resize<B+32>(), r);
    x = signedMod(-x, r); // y*r - x*modulus == 1
//  y = signedMod(y, modulus.template resize<B+32>());
    
    x0 = x[0];

//    assert(fullMultiply(y, r) - fullMultiply(x, modulus.template resize<B+32>()) == 1);
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
