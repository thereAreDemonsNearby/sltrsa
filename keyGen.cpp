#include "smallprimes.h"
#include "ntalgo.hpp"
#include <cstdio>
#include <cstdlib>
#include <thread>
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
//	auto p = primeGen().extend();
	BigUInt<2 * PrimeBits> p, q;
	std::thread thrd1{
		[&p]() {
			p = primeGen().extend();
			puts("key1 generated");
		}
	};
	std::thread thrd2{
		[&q]() {
			q = primeGen().extend();
			puts("key2 generated");
		}
	};
	thrd1.join();
	thrd2.join();
	
	
	auto n = p * q;
	auto phiN = (p - 1) * (q - 1);
	auto tup = exgcd(e, phiN);
//	assert(std::get<0>(tup) == 1);
	if (std::get<0>(tup) != 1) throw 250;
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

bool preTest(const BigUInt<PrimeBits>& n)
{
	BigUInt<PrimeBits> zero{0};

	for (int i = 0; i < 2000; ++i) {
		if (n % BigUInt<PrimeBits>(smallPrimes[i]) == zero) {
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
