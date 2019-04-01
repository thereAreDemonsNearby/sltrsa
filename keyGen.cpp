#include <fmt/format.h>
#include <cstdlib>
#include <thread>
#include <future>
#include <cassert>
#include <string>

#include "ntalgo.hpp"
#include "TimerGuard.h"
#include "primegen.hpp"

constexpr size_t PrimeBits = 1024;
const BigUInt<2*PrimeBits> e {65537};

template<typename... BIGUINTS>
int writeBigUInt(std::FILE* fp, BIGUINTS&&... args);

int main(int argc, char** argv)
{
    using namespace fmt::literals;
    int threadNum = 4;
    
    if (argc != 3) {	
	fmt::print(stderr, "usage: {} <public key> <private key>\n", argv[0]);
	std::exit(1);
    }

    bool done = false;
    while (not done) {
	BigUInt<PrimeBits> p, q;

	{
	    TimerGuard tg("Time used for gen the first prime: ");
	    p = primeGen_par<PrimeBits>(threadNum);
	}

	{
	    TimerGuard tg("Time used for gen the second prime: ");
	    q = primeGen_par<PrimeBits>(threadNum);
	}
	
	
	auto n = fullMultiply(p, q);
	// std::cout << "n width: " << significantBits(n) << std::endl;
	auto phiN = fullMultiply(p - 1, q - 1);
	BigUInt<PrimeBits * 2> d;
	if (!modInverse(e, phiN, d)) {
	    std::puts("Bad luck; regenerating...");
	    continue;
	}
	else
	    done = true;
	BigUInt<PrimeBits> pInv, qInv;
	modInverse(p, q, pInv);
	modInverse(q, p, qInv);

	std::FILE* pubk;
	std::FILE* prik;

	if ((pubk = std::fopen(argv[1], "wb")) == NULL) {
	    std::string msg = "cannot create public key file {}"_format(argv[1]);
	    std::perror(msg.c_str());
	    std::exit(1);
	}

	if ((prik = std::fopen(argv[2], "wb")) == NULL) {
	    std::string msg = "cannot create private key file {}"_format(argv[2]);
	    std::perror(msg.c_str());
	    std::exit(2);
	}

	// public key: e n
	writeBigUInt(pubk, e, n);

	// private key: d n p q pInv qInv
	writeBigUInt(prik, d, n, p, q, pInv, qInv);

	std::fclose(pubk);
	std::fclose(prik);
    }
}

template<typename... BIGUINTS>
int writeBigUInt(std::FILE* fp, BIGUINTS&&... args)
{
    return (std::fwrite(args.data().data(), sizeof(uint32_t), args.data().size(), fp), ...);
}
