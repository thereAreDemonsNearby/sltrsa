#include "smallprimes.h"
#include "ntalgo.hpp"
#include <cstdio>
#include <cstdlib>
#include <thread>
#include <future>
#include <cassert>

constexpr unsigned PrimeBits = 1024;
const BigUInt<2*PrimeBits> e {65537};

BigUInt<PrimeBits> primeGen();
bool primeTest(const BigUInt<PrimeBits>&);
bool preTest(const BigUInt<PrimeBits>&);

template<std::size_t B>
BigUInt<B> signedMod(BigUInt<B> a, BigUInt<B> const& n)
{
    if (a.negative()) {
	do {
	    a += n;
	} while (a.negative());
    } else {
	a %= n;
    }
    return a;
}

static const BigUInt<PrimeBits>& halfBits()
{
    static bool created = false;
    static BigUInt<PrimeBits> ret;
    if (!created) {
	created = true;
	for (int i = 0; i < ret.data().size() / 2; ++i) {
	    ret.data()[i] = UINT32_MAX;
	}
    }

    return ret;
}

int main(int argc, char** argv)
{
    if (argc != 3) {
	fprintf(stderr, "usage: %s <pubkey> <privkey>\n", argv[0]);
	std::exit(1);
    }

    bool done = false;
    while (not done) {
	auto fut1 = std::async([](){ return primeGen().extend(); });
	auto fut2 = std::async([](){ return primeGen().extend(); });
	BigUInt<2 * PrimeBits> p, q;
	p = std::move(fut1.get()); std::puts("key1 generated");
	q = std::move(fut2.get()); std::puts("key2 generated");
	
	
	auto n = p * q;
	auto phiN = (p - 1) * (q - 1);
	auto tup = exgcd(e, phiN);
//	assert(std::get<0>(tup) == 1);
	if (std::get<0>(tup) != 1) {
	    std::puts("Bad luck; regenerating...");
	    continue;
	}
	else
	    done = true;
	auto d = signedMod(std::get<1>(tup), phiN); // e^(-1) mod n = s mod n

	std::FILE* pubk;
	std::FILE* prik;

	if ((pubk = std::fopen(argv[1], "wb")) == NULL) {
	    std::perror("cannot create publickey");
	    std::exit(1);
	}

	if ((prik = std::fopen(argv[2], "wb")) == NULL) {
	    std::perror("cannot create privatekey");
	    std::exit(2);
	}

	// TODO error handling
	std::fwrite(e.data().data(), sizeof(uint32_t), e.data().size(), pubk);
	std::fwrite(n.data().data(), sizeof(uint32_t), n.data().size(), pubk);
	std::fwrite(d.data().data(), sizeof(uint32_t), d.data().size(), prik);
	std::fwrite(n.data().data(), sizeof(uint32_t), n.data().size(), prik);

	std::fclose(pubk);
	std::fclose(prik);
    }
}

bool preTest(const BigUInt<PrimeBits>& n)
{
    for (int i = 0; i < 2000; ++i) {
	auto copy = n;
	if (copy.divideU32(smallPrimes[i]) == 0) {
	    return false;
	}
    }

    return true;
}

bool primeTest(const BigUInt<PrimeBits>& n)
{
    if (!preTest(n))
	return false;

    return !millerRabin(n, 10);
}

BigUInt<PrimeBits> primeGen()
{
    auto r = BigUInt<PrimeBits>::randomGenOdd();
    while (r < halfBits()) {
	r = BigUInt<PrimeBits>::randomGenOdd();
    }
    while (!primeTest(r)) {
	r += 2;
    }
    return r;
}
