#ifndef BIGUINT_H_
#define BIGUINT_H_
#include <array>
#include <vector>
#include <cinttypes>
#include <string>
#include <algorithm>
#include <random>
#include <stdexcept>
#include <cassert>
#include <type_traits>

template<std::size_t BITS_>
class BigUInt;

template<std::size_t BITS_>
class BigUInt
{
    typedef std::true_type has_divide;

    static_assert(BITS_ % 32 == 0, "not beishu of 32!");
    using self = BigUInt;
	
    friend class BigUInt<BITS_ *2>;
    friend class BigUInt<BITS_ /2>;  
    
public:
    using inner_type = uint32_t;
    
    static constexpr std::size_t VLEN = BITS_ / 32;
    static const std::size_t BITS = BITS_;
    
    static self fromDec(const std::string& decString) {
	self result;
	for (auto it = decString.begin(); it != decString.end(); ++it) {
	    result *= 10;
	    result += *it - '0';
	}
	return result;
    }

    static self fromHex(const std::string& hexString) {        
        auto toNum = [](char ch) {
            ch = std::tolower(ch);
            if (ch >= '0' && ch <= '9') {
                return ch - '0';
            } else if (ch >= 'a' && ch <= 'f') {
                return ch - 'a' + 10;
            } else
                assert(false);
        };
        self result;
        for (auto it = hexString.begin(); it != hexString.end(); ++it) {
            result *= 16;
            result += toNum(*it);
        }
        return result;
    }
    
    BigUInt() : data_( VLEN, 0 ) {}
    BigUInt(uint64_t n) : BigUInt() {
	data_[0] = n;
	data_[1] = n >> 32;
    }
    BigUInt(const self&) = default;
    BigUInt(self&&) = default;
    template <std::size_t B, typename=std::enable_if_t<B != BITS_, void>>
    BigUInt(BigUInt<B>&& another)
        : data_(std::move(another.data()))
    {
        data_.resize(BITS_ / 32, 0);
    }
    BigUInt(std::vector<uint32_t>&& dat)
        : data_(std::move(dat))
    {
        assert(data_.size() == BITS_ / 32);
    }
    self& operator= (const self& rhs) = default;
    self& operator= (self&& rhs) = default;
    self& operator= (uint64_t u) {
	std::fill(data_.begin() + 2, data_.end(), 0);
	data_[0] = u;
	data_[1] = u >> 32;
	return *this;
    };

    // arithmetic 
    self operator+(const self& rhs) const;
    self& operator+= (const self& rhs);
    self operator-(const self& rhs) const;
    self operator-() const { auto a = *this; a.flip(); return a + 1; }
    self& operator-= (const self& rhs);
    self operator*(const self& rhs) const;
    self& operator*= (const self& rhs);
    // unsigned / and %.
    self operator/(const self& rhs) const;
    self& operator/=(const self& rhs);
    self operator% (const self& rhs) const;
    self& operator%= (const self& rhs);
    self operator<< (std::size_t off);
    self& operator<<= (std::size_t off);
    self operator>> (std::size_t off);
    self& operator>>= (std::size_t off);
    self operator& (const self& rhs) const {
        self ret;
        for (std::size_t i = 0; i < VLEN; ++i)
            ret[i] = data_[i] & rhs[i];
        return ret;
    }
    

    self divide(const self& rhs); // do divide in-place.
    uint32_t divideU32(uint32_t);
    //returns the remainder
    
    BigUInt& flip() {
	for (auto& u : data_) {
	    u = ~u;
	}
	return *this;
    }

    BigUInt& incr() {
	uint32_t carry = 0;
	data_[0] += 1;
	carry = data_[0] == 0;
	for (size_t i = 1; i < VLEN && carry; ++i ) {
	    data_[i] += carry;
	    carry = data_[i] == 0;
	}
	return *this;
    }

    BigUInt& reset() {
        for (auto& e : data_)
            e = 0;
        return *this;
    }
    
    // unsigned compare
    int compare(const self& rhs) const;
    
    bool operator> (const self& rhs) const {
	return compare(rhs) > 0;
    }

    bool operator< (const self& rhs) const {
	return compare(rhs) < 0;
    }

    bool operator>= (const self& rhs) const {
	return compare(rhs) >= 0;

    }

    bool operator<= (const self& rhs) const {
	return compare(rhs) <= 0;
    }

    bool operator== (const self& rhs) const {
	return compare(rhs) == 0;
    }

    bool operator!= (const self& rhs) const {
	return compare(rhs) != 0;
    }

    // observer
    uint32_t& operator[](std::size_t idx) {
        return data_[idx];        
    }

    uint32_t operator[](std::size_t idx) const {
        return data_[idx];
    }
    
    BigUInt<2 * BITS_> extend() const {
	BigUInt<2 * BITS_> res;
	for (int i = 0; i < data_.size(); ++i) {
	    res.data_[i] = data_[i];
	}
	return res;
    }

    template<size_t MoreOrLessBits>
    BigUInt<MoreOrLessBits> resize() const {      
	BigUInt<MoreOrLessBits> res{0};
	constexpr size_t less = std::min(BITS_, MoreOrLessBits);
	for (int i = 0; i < less / 32; ++i) {
	    res.data()[i] = data_[i];
	}
	return res;
    }

    template<size_t MoreOrLessBits>
    BigUInt<MoreOrLessBits> resizeMove() && {  
	BigUInt<MoreOrLessBits> res(std::move(*this));
	return res;
    }

    BigUInt<BITS_ / 2> trunc() const {
	BigUInt<BITS_ / 2> res;
	for (int i = 0; i < res.data().size(); ++i) {
	    res.data_[i] = data_[i];
	}
	return res;
    }
	
    std::string toBitString() const;
    std::string toDec() const;
    std::string toHex() const;
    std::size_t countSignificand() const;

    std::vector<uint32_t>& data() {
	return data_;
    }
    
    const std::vector<uint32_t>& data() const {
	return data_;
    }

    uint32_t toU32() const {
	return data_[0];
    }

    uint64_t toU64() const {
	uint64_t res = data_[0];
	res |= static_cast<uint64_t>(data_[1]) << 32;
	return res;
    }

    // factory
    static self randomGen() {
	self ret;
	std::random_device dev;
	std::uniform_int_distribution<uint32_t> dist(0, UINT32_MAX);
	for (auto& u : ret.data_) {
	    u = dist(dev);
	}

	return ret;
    }

    static self randomGenOdd() {
	self ret = randomGen();
	if (ret.data_[0] % 2 == 0) {
	    ret.data_[0] += 1;
	}
	return ret;
    }

    static self randomGenFullBitsOdd() {
	self ret;
	std::random_device dev;
	std::uniform_int_distribution<uint32_t> highestByteDist(static_cast<uint32_t>(INT32_MIN), UINT32_MAX);
	std::uniform_int_distribution<uint32_t> dist(0, UINT32_MAX);
	for (size_t i = 0; i < VLEN - 1; ++i) {
	    ret.data_[i] = dist(dev);
	}
	ret.data_[VLEN - 1] = highestByteDist(dev);
	if (ret.data_[0] % 2 == 0) {
	    ret.data_[0] += 1;
	}
	return ret;
    }

    bool negative() {
	uint32_t highest = data_[VLEN-1];
	return highest & 0x80000000;
    }

    static const uint64_t mask_ = 0xffffffff;
private:
    std::vector<uint32_t> data_;
    
    static const std::size_t SLEN = 32;

    void set_LtoH(std::size_t pos, bool bit) {
	auto which = pos / SLEN;
	auto where = pos % SLEN;
	uint32_t mask = 1 << where;
	if (bit)
	    data_[which] |= mask;
	else
	    data_[which] &= ~mask;
    }

    bool get_LtoH(std::size_t pos) {
	auto which = pos / SLEN;
	auto where = pos % SLEN;
	uint32_t mask = 1 << where;
	return (data_[which] & mask) != 0;
    }
};


template<std::size_t B>
BigUInt<B> BigUInt<B>::operator+(const BigUInt<B>& rhs) const
{
    uint64_t carry = 0;
    self result;
    for (size_t i = 0; i < VLEN; ++i) {
	uint64_t sum = static_cast<uint64_t>(data_[i]) + rhs.data_[i] + carry;
	result.data_[i] = sum & mask_;
	carry = !!((sum & (~mask_)) > 0);
    }

    return result;
}

template<std::size_t B>
BigUInt<B>& BigUInt<B>::operator+= (const BigUInt& rhs)
{
    auto result = *this + rhs;
    data_ = std::move(result.data_);
    return *this;
}

template<std::size_t B>
BigUInt<B> BigUInt<B>::operator-(const BigUInt& rhs) const
{
    auto f = rhs;
    f.flip();
    f.incr();
    return *this + f;
}

template<std::size_t B>
BigUInt<B>& BigUInt<B>::operator-= (const BigUInt<B>& rhs)
{
    auto f = rhs;
    f.flip();
    f.incr();
    *this += f;
    return *this;
}

template<std::size_t B>
BigUInt<B> BigUInt<B>::operator<< (std::size_t offset)
{
    self result;
    if (offset < 0 || offset >= BITS) {
	throw std::out_of_range("shift offset out of range");
    }

    if (offset == 0)
	return *this;
    
    std::size_t pos = offset / SLEN;
    std::size_t off = offset % SLEN;
    uint32_t maskFromPrev = 0;
    for (size_t i = pos; i < VLEN; ++i) {
	result.data_[i] = data_[i - pos] << off;
	result.data_[i] |= maskFromPrev;
	// maskFromPrev = data_[i-pos] >> (SLEN - off);
	// in case that off == 0
	maskFromPrev = (data_[i - pos] >> (SLEN - off - 1)) >> 1;
    }
    return result;
}

template<std::size_t B>
BigUInt<B>& BigUInt<B>::operator<<= (std::size_t offset)
{
    auto res = *this << offset;
    *this = std::move(res);
    return *this;
}

template<std::size_t B>
BigUInt<B> BigUInt<B>::operator>> (std::size_t offset)
{
    if (offset < 0 || offset >= BITS) {
	throw std::out_of_range("shift offset out of range");
    }

    if (offset == 0)
	return *this;

    self result;
    std::size_t step = offset / SLEN;
    std::size_t off = offset % SLEN;
    uint32_t maskFromPrev = 0;
    for (int i = VLEN - 1 - step; i >= 0; --i) {
	result.data_[i] = data_[i + step] >> off;
	result.data_[i] |= maskFromPrev;
	maskFromPrev = (data_[i + step] << (SLEN - off - 1)) << 1;
    }
    return result;
}

template<std::size_t B>
BigUInt<B>& BigUInt<B>::operator>>= (std::size_t offset)
{
    *this = std::move(*this >> offset);
    return *this;
}

template<std::size_t B>
BigUInt<B> BigUInt<B>::operator* (const BigUInt& rhs) const
{
    BigUInt result;
    uint64_t sum;
    uint64_t carry;
    for (int i = 0; i < VLEN; ++i) {
	carry = 0;
	if (rhs.data_[i] != 0) {
	    for (int j = 0; i + j < VLEN; ++j) {
		sum = static_cast<uint64_t>(rhs.data_[i]) * data_[j]
		    + carry + result.data_[i + j];
		result.data_[i + j] = (sum & mask_);
		carry = sum / 0x10000 / 0x10000; // why doing so?
	    }
	}
    }
    return result;
}

template<std::size_t B>
BigUInt<B>& BigUInt<B>::operator*= (const BigUInt& rhs)
{
    *this = std::move(*this * rhs);
    return *this;
}

template<std::size_t B>
BigUInt<B> BigUInt<B>::operator/ (const BigUInt& rhs) const
{
    auto copy = *this;
    copy.divide(rhs);
    return copy;
}

template<std::size_t B>
BigUInt<B>& BigUInt<B>::operator/= (const BigUInt& rhs)
{
    this->divide(rhs);
    return *this;
}

template<std::size_t B>
BigUInt<B> BigUInt<B>::operator% (const BigUInt& rhs) const
{
    auto copy = *this;
    return copy.divide(rhs);
}

template<std::size_t B>
BigUInt<B>& BigUInt<B>::operator%= (const BigUInt& rhs)
{
    *this = this->divide(rhs);
    return *this;
}

template<std::size_t B>
BigUInt<B> BigUInt<B>::divide(const self& rhs)
{
    if (rhs == BigUInt(0)) {
	// TODO : choose the exact exception
	throw 0;
    }

    if (*this < rhs) {
	auto rmd = *this;
	for (auto& u : data_) u = 0;
	return rmd;
    }
    auto len = countSignificand();
    auto rhsLen = rhs.countSignificand();     assert(len >= rhsLen);
    auto shift = len - rhsLen;
    
    auto remainder = *this >> shift;
    if (remainder < rhs) {
	shift -= 1;
	remainder = *this >> shift;
    }

    self result;
    int posToSet = BITS - 1;
    int posToGet = shift - 1;
    result.set_LtoH(posToSet--, 1);
    remainder -= rhs;

    while (posToGet >= 0) {
	remainder <<= 1;
	remainder.set_LtoH(0, get_LtoH(posToGet--));

	if (remainder >= rhs) {
	    remainder -= rhs;
	    result.set_LtoH(posToSet--, 1);
	} else {
	    result.set_LtoH(posToSet--, 0);
	}
    }

    *this = result >> (posToSet + 1);
    return remainder;
}

template<std::size_t B>
uint32_t BigUInt<B>::divideU32(uint32_t divisor)
{
    uint32_t remainder = 0;
    uint64_t part = 0;    
    for (auto rb = data_.rbegin(); rb != data_.rend(); ++rb) {
	part = static_cast<uint64_t>(remainder) << 32;
	part |= *rb;

	uint64_t quotient = part / divisor;
	remainder = part % divisor;
	assert((quotient & ~mask_) == 0);
	*rb = static_cast<uint32_t>(quotient);
    }

    return remainder;
}


template<std::size_t B>
int BigUInt<B>::compare(const self& rhs) const
{
    auto leftBegin = data_.crbegin();
    auto leftEnd = data_.crend();
    auto rightBegin = rhs.data_.crbegin();
    for (; leftBegin != leftEnd; ++leftBegin, ++rightBegin) {
	if (*leftBegin > *rightBegin) {
	    return 1;
	} else if (*leftBegin < *rightBegin) {
	    return -1;
	}
    }

    return 0;
}

template<std::size_t B>
std::size_t BigUInt<B>::countSignificand() const
{
    std::size_t cnt = 0;
    for (auto it = data_.rbegin(); it != data_.rend(); ++it) {
	auto val = *it;
	uint32_t mask = 1 << 31;
	do {
	    if ((val & mask) == 0)
		++cnt;
	    else
		return BITS - cnt;
	    mask >>= 1;
	} while (mask != 0);
    }

    return 0;
}

template<std::size_t B>
std::string BigUInt<B>::toBitString() const
{
    std::string str;
    str.reserve(1024);
    for (auto it = data_.crbegin(); it != data_.crend(); ++it) {
	uint32_t mask = 1;
	for (int i = 31; i >= 0; --i) {
	    if ((*it & (mask << i)) > 0) {
		str.push_back('1');
	    } else {
		str.push_back('0');
	    }
	}
    }

    return str;
}

template<std::size_t B>
std::string BigUInt<B>::toDec() const
{
    std::string result;
    result.reserve(128);
    uint32_t segment{1000000000}; // 10,0000,0000
    BigUInt zero;
    BigUInt copy = *this;
    while (copy != zero) {
	
	uint32_t rmd = copy.divideU32(segment);
	for (int i = 0; i < 9; ++i) {
	    auto r = rmd % 10;
	    rmd /= 10;
	    result.push_back(r + '0');	    
	}
    }
    while (result.back() == '0')
	result.pop_back();
    std::reverse(result.begin(), result.end());
    
    return result;
}

template<std::size_t B>
std::string BigUInt<B>::toHex() const
{
    auto intToHex = [](uint32_t v) ->char {
        if (v >= 0 && v <= 9)
            return v + '0';
        else if (v >=10 && v < 16)
            return v - 10 + 'a';
        else
            assert(false);
    };
    
    std::string result;
    int i;
    auto copy = *this;
    while (copy > 0) {
        uint32_t rmd = copy.divideU32(16);
        result.push_back(intToHex(rmd));        
    }
    std::reverse(result.begin(), result.end());
    return result;
}

template <std::size_t B1, std::size_t B2>
BigUInt<B1+B2> fullMultiply(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs)
{    
    BigUInt<B1+B2> result = 0;
    uint64_t carry;
    for (size_t i = 0; i < BigUInt<B2>::VLEN; ++i) {
	carry = 0;
	for (size_t j = 0; j < BigUInt<B1>::VLEN; ++j) {
	    uint64_t tmp = static_cast<uint64_t>(lhs.data()[j]) * rhs.data()[i]
		+ carry + result.data()[i + j];
	    result.data()[i + j] = (tmp & BigUInt<B1>::mask_);
	    carry = tmp / 0x10000 / 0x10000; // mod 2^32
	}
	result.data()[i + BigUInt<B1>::VLEN] = carry;
    }

    return result;
}

template <std::size_t BitsMore, std::size_t BitsLess>
BigUInt<BitsLess> modLess(BigUInt<BitsMore> const& lhs, BigUInt<BitsLess> const& rhs)
{
    static_assert(BitsMore >= BitsLess);
    return (lhs % rhs.template resize<BitsMore>()).template resize<BitsLess>();
}


#endif
