#include <cstdio>
#include <cstdlib>
#include "ntalgo.hpp"

static constexpr size_t PrimeBits = 1024;
static constexpr size_t KeyBits = 2 * PrimeBits;


int main()
{
	std::FILE* pub;
	std::FILE* priv;
	if ((pub = std::fopen("publickey", "rb")) == NULL) {
		std::perror("cannot open publickey");
		std::exit(1);
	}
	if ((priv = std::fopen("privatekey", "rb")) == NULL) {
		std::perror("cannot open privatekey");
		std::exit(2);
	}

	BigUInt<KeyBits> e, d, n1, n2;
	fread(e.data().data(), sizeof(uint32_t), e.data().size(), pub);
	fread(n1.data().data(), sizeof(uint32_t), n1.data().size(), pub);
	fread(d.data().data(), sizeof(uint32_t), d.data().size(), priv);
	fread(n2.data().data(), sizeof(uint32_t), n2.data().size(), priv);
	if (n1 != n2) {
		printf("not equal error\n");
		std::exit(3);
	}

	for (uint64_t dat = 111111111111L; dat <= 111111111131L; ++dat) {
		BigUInt<KeyBits> mice(dat);
		printf("before encryption: %s\n", mice.toDec().c_str());
		auto encr = modularExp(mice, e, n1);
		printf("after encryption: %s\n", encr.toDec().c_str());
		auto decr = modularExp(encr, d, n1);
		printf("after decryption: %s\n", decr.toDec().c_str());
	}
}
