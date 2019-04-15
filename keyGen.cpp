#include <fmt/format.h>
#include <cstdlib>
#include <thread>
#include <future>
#include <cassert>
#include <cstring>
#include <errno.h>
#include <string>

#include "ntalgo.hpp"
#include "TimerGuard.h"
#include "primegen.hpp"

static int threadNum = 6;

template<typename... BIGUINTS>
int writeBigUInt(std::FILE* fp, BIGUINTS&&... args);

template<std::size_t PrimeBits>
void keyGen(char const* pub, char const* priv);

static bool toNumber(char const* str, std::size_t* n)
{
    char* end;
    *n = std::strtoul(str, &end, 10);
    if (*end != '\0' || errno == ERANGE) {
        return false;
    } else {
        return true;
    }
}

int main(int argc, char** argv)
{
    using namespace fmt::literals;

    char const* pubKeyFile;
    char const* privKeyFile;
    std::size_t keyLen = 2048;

    std::size_t idx = 1;
    if (idx < argc && std::strcmp(argv[idx], "-l") == 0) {
        ++idx;
        if (idx < argc && toNumber(argv[idx], &keyLen)) {
            if (keyLen != 1024 && keyLen != 2048 && keyLen != 4096) {
                fmt::print(stderr, "{} is not a valid key length\n", argv[idx]);
                std::exit(1);
            }
            ++idx;
        } else {
            fmt::print(stderr, "{} is not a valid key length\n", argv[idx]);
            std::exit(1);
        }        
    } else if (idx < argc && std::strcmp(argv[idx], "--help") == 0) {
        fmt::print(stderr, "usage: {} [-l 1024|2048|4096] <public key> <private key>\n", argv[0]);
        std::exit(1);
    }

    if (idx < argc && idx + 2 == argc) {
        pubKeyFile = argv[idx];
        privKeyFile = argv[idx + 1];
    } else {
        fmt::print(stderr, "usage: {} [-l 1024|2048|4096] <public key> <private key>\n", argv[0]);
        std::exit(1);
    }

    if (keyLen == 1024) {
        keyGen<512>(pubKeyFile, privKeyFile);
    } else if (keyLen == 2048) {
        keyGen<1024>(pubKeyFile, privKeyFile);
    } else {
        keyGen<2048>(pubKeyFile, privKeyFile);
    }  
}

template<std::size_t PrimeBits>
void keyGen(char const* pub, char const* priv)
{
    using namespace fmt::literals;
        
    const BigUInt<2*PrimeBits> e {65537};
    
    bool done = false;
    while (not done) {
	BigUInt<PrimeBits> p, q;

	{
	    // TimerGuard tg("Time used for gen the first prime: ");
	    p = primeGen_par<PrimeBits>(threadNum);
	}

	{
	    // TimerGuard tg("Time used for gen the second prime: ");
	    q = primeGen_par<PrimeBits>(threadNum);
	}	
	
	auto n = fullMultiply(p, q);
	// std::cout << "n width: " << significantBits(n) << std::endl;
	auto phiN = fullMultiply(p - 1, q - 1);
	BigUInt<PrimeBits * 2> d;
	if (!modInverse(e, phiN, d)) {
	    std::puts("Bad luck; regenerating...");
	    continue;
	} else {
            done = true;
        }
        
	BigUInt<PrimeBits> pInv, qInv;
	modInverse(p, q, pInv);
	modInverse(q, p, qInv);

	std::FILE* pubk;
	std::FILE* prik;

	if ((pubk = std::fopen(pub, "w")) == NULL) {
	    std::string msg = "cannot create public key file {}"_format(pub);
	    std::perror(msg.c_str());
	    std::exit(1);
	}

	if ((prik = std::fopen(priv, "w")) == NULL) {
	    std::string msg = "cannot create private key file {}"_format(priv);
	    std::perror(msg.c_str());
	    std::exit(2);
	}

        // e n
        fmt::print(pubk, "----SLTRSA-{0}----\n----PublicKey----\n{1}\n{2}\n{3}\n{4}\n",
                   2*PrimeBits,
                   "----e----", e.toDec(),
                   "----n----", n.toDec());

        // d n p q pInv qInv
        fmt::print(prik, "----SLTRSA-{0}----\n----PrivateKey----\n"
                   "{1}\n{2}\n{3}\n{4}\n{5}\n{6}\n{7}\n{8}\n{9}\n{10}\n{11}\n{12}\n",
                   2*PrimeBits,
                   "----d----", d.toDec(),
                   "----n----", n.toDec(),
                   "----p----", p.toDec(),
                   "----q----", q.toDec(),
                   "----pInv----", pInv.toDec(),
                   "----qInv----", qInv.toDec());
	std::fclose(pubk);
	std::fclose(prik);
    }
}
