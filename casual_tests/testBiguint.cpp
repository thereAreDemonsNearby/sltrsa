#include <iostream>
#include <cinttypes>
#include <random>
#include <chrono>
#include <string>
#include "../biguint.h"
#include "../ntalgo.h"

#define AssertTrue(booleanexpr)						\
    do {								\
        bool b = (booleanexpr);						\
        if (!b) {							\
	    std::cerr << "AssertTrue failed in line " << __LINE__ << std::endl; \
	    throw 0;							\
        }								\
    } while(0)

class timerGuard
{
public:
    timerGuard() : start(std::chrono::system_clock::now()) {}
    ~timerGuard() {
	auto end = std::chrono::system_clock::now();
	std::chrono::duration<double> du = end - start;
	std::cerr << "Time elapsed: " << du.count() << std::endl;
    }
private:
    std::chrono::system_clock::time_point start;
};

std::string string_shiftLeft(std::string str, std::size_t off_)
{
    int off = off_;
    for (int i = 0; i < str.size() - off; ++i) {
	str[i] = str[i + off];
    }
    for (int i = str.size() - off; i < str.size(); ++i) {
	str[i] = '0';
    }
    return str;
}

std::string string_shiftRight(std::string str, std::size_t off_)
{
    int off = off_;
    for (int i = str.size() - 1; i >= off; --i) {
	str[i] = str[i - off];	
    }
    for (int i = off - 1; i >= 0; --i) {
	str[i] = '0';
    }
    return str;
}

void testSimpleCases()
{
    // for first-time debug
    
    // const int loop = 50;
    // std::random_device dev;
    // std::uniform_int_distribution<uint64_t> dist(0, 1000);
    // for (int i = 0; i < loop; ++i) {
    // 	uint64_t n1 = dist(dev);
    // 	uint64_t n2 = dist(dev);
    // 	BigUInt<64> bn1{n1};
    // 	BigUInt<64> bn2{n2};
    // 	// std::cout << n1 << ", " << n2 << '\n';
    // 	AssertTrue(n1 + n2 == (bn1 + bn2).toU64());
    // }

    // BigUInt<64> a{UINT64_MAX};
    // BigUInt<64> b{UINT64_MAX-1};
    // std::cout << a.toU64() << ", " << b.toU64() << std::endl;
    // auto res = a + b;
    // std::cout << res.toU64() << std::endl;
    // std::cout << res.toBitString() << std::endl;
}

template<typename Func>
void testBaseLoop(Func&& fn)
{
    timerGuard t__;
    const int loop = 100000;
    std::random_device dev;
    std::uniform_int_distribution<uint64_t> dist(0, UINT64_MAX);
    for (int i = 0; i < loop; ++i) {
	uint64_t n1 = dist(dev);
	uint64_t n2 = dist(dev);
	fn(n1, n2);
    }
    std::cerr << "One pass passed" << std::endl;
}

void testAdd(uint64_t n1, uint64_t n2)
{
    BigUInt bn1{64, n1};
    BigUInt bn2{64, n2};
    uint64_t sum = n1 + n2;
    BigUInt bsum = bn1 + bn2;

    if (sum != bsum.toU64()) {
	std::cerr << "add failed. n1: " << n1
		  << ", n2: " << n2 << '\n';
	std::cerr << "Should be: " << sum << '\n';
	std::cerr << "Actually:  " << bsum.toU64() << std::endl;
	throw 0;
    }
}

void testSub(uint64_t n1, uint64_t n2)
{
    BigUInt bn1{64, n1};
    BigUInt bn2{64, n2};
    uint64_t sub = n1 - n2;
    BigUInt bsub = bn1 - bn2;

    if (sub != bsub.toU64()) {
	std::cerr << "sub failed. n1: " << n1
		  << ", n2: " << n2 << '\n';
	std::cerr << "Should be: " << sub << '\n';
	std::cerr << "Actually:  " << bsub.toU64() << std::endl;
	throw 0;
    }
}

void testMult(uint64_t n1, uint64_t n2)
{
    BigUInt bn1{64, n1};
    BigUInt bn2{64, n2};
    uint64_t mul = n1 * n2;
    BigUInt bmul = bn1 * bn2;

    if (mul != bmul.toU64()) {
	std::cerr << "mult failed. n1: " << n1
		  << ", n2: " << n2 << '\n';
	std::cerr << "Should be: " << mul << '\n';
	std::cerr << "Actually:  " << bmul.toU64() << std::endl;
	throw 0;
    }

}

void testDivision(uint64_t n1, uint64_t n2)
{
    BigUInt bn1{64, n1};
    BigUInt bn2{64, n2};
    uint64_t div = n1 / n2;
    uint64_t rmd = n1 % n2;
    BigUInt brmd = bn1.divide(bn2);

    if (div != bn1.toU64()) {
	std::cerr << "division failed. n1: " << n1
		  << ", n2: " << n2 << '\n';
	throw 0;
    }

    if (brmd.toU64() != rmd) {
	std::cerr << "mod failed. n1: " << n1
		  << ", n2: " << n2 << '\n';
	throw 0;
    }
}



void testToDec()
{
    const int loop = 100;
    std::random_device dev;
    std::uniform_int_distribution<uint64_t> dist(0, UINT64_MAX);
    for (int i = 0; i < loop; ++i) {
	uint64_t n = dist(dev);
	BigUInt bn{64, n};
	std::string str = std::to_string(n);	
	if (str != bn.toDec()) {
	    std::cerr << "Convert to string failed.\n"
		      << "Should be: " << str
		      << "\nActually:  " << bn.toDec() << '\n';
	    throw 0;
	}
    }
    std::cerr << "One pass passed" << std::endl;
}

void testShift()
{
    std::random_device dev;
    std::uniform_int_distribution<uint64_t> numDist(0, UINT64_MAX);
    std::uniform_int_distribution<std::size_t> shiftDist(0, 63);

    const int loop = 1000;
    for (int i = 0; i < loop; ++i) {
	uint64_t n = numDist(dev);
	BigUInt bn(64, n);
	std::size_t s = shiftDist(dev);
	auto m = n << s;
	auto bm = bn << s;
	if (m != bm.toU64()) {
	    std::cerr << "Shift failed. n: " << n
		      << ", offset: " << s
		      << "  left shift.";
	    throw 0;
	}

	auto p = n >> s;
	auto bp = bn >> s;
	
	if (p != bp.toU64()) {
	    std::cerr << "Shift failed. n: " << n
		      << ", offset: " << s
		      << "  right shift.\n";
	    throw 0;
	}
    }

    std::cerr << "One pass passed" << std::endl;
}

void testShiftBoost()
{
    const auto bits = 96;
    std::random_device dev;
    std::uniform_int_distribution<std::size_t> shiftDist(0, bits - 1);
    const int loop = 1000;
    for (int i = 0; i < loop; ++i) {
	auto off = shiftDist(dev);
	auto big = BigUInt::randomGen(bits);
	auto origStr = big.toBitString();
	
	auto left = big << off;
	if (left.toBitString() != string_shiftLeft(origStr, off)) {
	    std::cerr << "Shift left failed. \nn: " << big.toBitString()
		      <<"\nshouldbe: " << string_shiftLeft(origStr, off)
		      <<"\nactual:   " << left.toBitString() << std::endl;
	    throw 0;
	}

	auto right = big >> off;
	if (right.toBitString() != string_shiftRight(origStr, off)) {
	    std::cerr << "Shift right failed. \nn: " << big.toBitString()
		      <<"\nshouldbe: " << string_shiftRight(origStr, off)
		      <<"\nactual:   " << right.toBitString() << std::endl;
	    throw 0;
	}
    }

    std::cerr << "Shift boost pass passed" << std::endl;
}

void testGcd()
{
    timerGuard t__;
    std::random_device dev;
    std::uniform_int_distribution<uint64_t> numDist(0, UINT64_MAX);
    constexpr int loop = 1000;
    for (int i = 0; i < loop; ++i) {
	uint64_t n1 = numDist(dev);
	uint64_t n2 = numDist(dev);
	BigUInt bn1(64, n1);
	BigUInt bn2(64, n2);
	// uint64_t d = gcd(n1, n2);
	// auto bd = gcd(bn1, bn2);

	auto exd = exgcd(n1, n2);
	auto exbd = exgcd(bn1, bn2);

	// if (bd.toU64() != d) {
	//     std::cerr << "gcd error" << std::endl;
	//     throw 0;
	// }

	if (std::get<0>(exbd).toU64() != std::get<0>(exd)) {
	    std::cerr << "gcd error 2" << std::endl;
	    throw 0;
	}

	// if (d != std::get<0>(exd)) {
	//     std::cerr << "gcd error 3" << std::endl;
	//     std::cout << n1 << ' ' << n2 << ' ' << d << ' ' << std::get<0>(exd) << std::endl;
	//     throw 0;
	// }
    }
    std::cerr << "gcd test passed" << std::endl;	 
}

void testGcdNum()
{
    uint64_t n1, n2;
    n1 = 1000000000000L;
    n2 = 2000000000000L;
    AssertTrue(std::get<0>(exgcd(n1, n2)) == n1);
    n1 = 1000000000000L;
    n2 = 5;
    AssertTrue(std::get<0>(exgcd(n1, n2)) == n2);
    n1 = 108;
    n2 = 72;
    AssertTrue(std::get<0>(exgcd(n1, n2)) == 36);
    std::cerr << "gcdnum passed" << std::endl;
}

void testMillerRabin()
{
    timerGuard t__;
    bool sieve[1000000];
    std::fill(sieve, sieve + 1000000, true);
    for (int i = 2; i <= 1000; ++i) {
	if (sieve[i]) {
	    for (int j = i+i; j < 1000000; j = j+i) {
		sieve[j] = false;			   
	    }
	}
    }

    for (unsigned i = 7; i < 100000; i += 2) {
	// if (i % 10000 == 0)
	// 	std::cout << "i " << i << '\n';
	bool m = millerRabin(BigUInt(64, i));
	// AssertTrue(m == !sieve[i]);
	if (m != !sieve[i]) {
	    std::cout << i << ' ' << m << ' ' << sieve[i] << std::endl;
	    throw 0;
	}
    }
}

void testDivideU32()
{
    std::random_device dev;
    std::uniform_int_distribution<uint32_t> dist(0, UINT32_MAX);
    for (int i = 0; i < 1000; ++i) {
	auto a = BigUInt::randomGen(1024);
	auto aDup = a;
	uint32_t b = dist(dev);
	BigUInt bBig{1024};

	{
	    timerGuard g;
	    a.divide(bBig);
	}

	{
	    timerGuard g;
	    aDup.divideU32(b);
	}

	if (a != aDup) {
	    std::cout << "divideU32 failed\n";
	    std::cout << a.toDec() << "\n" << aDup.toDec() << "\n";
	}
    }
}

int main()
{
    testBaseLoop(testAdd);
    testBaseLoop(testSub);
    testBaseLoop(testMult);
    testBaseLoop(testDivision);
    testToDec();
    testShift();
    testShiftBoost();

    testGcd();
    testGcdNum();

    testMillerRabin();
    testDivideU32();
}
