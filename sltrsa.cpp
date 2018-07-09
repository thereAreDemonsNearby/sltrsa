#include <cstdio>
#include <cstdlib>
#include <utility>
#include <cstring>
#include "ntalgo.hpp"

static constexpr std::size_t PrimeBits = 1024;
static constexpr std::size_t KeyBits = 2 * PrimeBits;
static constexpr std::size_t PlainUnitBytes = 1024 / 8;
static constexpr std::size_t CipherUnitBytes = 2048 / 8;

using KeyPair = std::pair<BigUInt<KeyBits>,	BigUInt<KeyBits>>;

KeyPair readKey(const char* keyfile);

std::size_t fileSize(std::FILE* fp);

void encrypt(const char* src, const char* dst, const KeyPair& key);
void decrypt(const char* src, const char* dst, const KeyPair& key);

int main(int argc, char* argv[])
{
	if (argc != 5) {
		std::fprintf(stderr,
					 "usage: %s [-e/-d] <key> <file> <result>\n", argv[0]);
		std::exit(1);
	}
	const char* keyfile = argv[2];
	const char* src = argv[3];
	const char* dst = argv[4];

	auto keypair = readKey(keyfile);

	if (std::strcmp(argv[1], "-e") == 0) {
		encrypt(src, dst, keypair);
	} else if (std::strcmp(argv[1], "-d") == 0) {
		decrypt(src, dst, keypair);
	} else {
		std::fprintf(stderr, "unknown option %s\n", argv[1]);
		std::exit(1);
	}
}

void encrypt(const char* src, const char* dst, const KeyPair& key)
{
	std::FILE* fpsrc = std::fopen(src, "rb");
	if (!fpsrc) {
		std::fprintf(stderr, "cannot open %s\n", src);
		std::exit(1);
	}

	std::FILE* fpdst = std::fopen(dst, "wb");
	if (!fpdst) {
		std::fprintf(stderr, "cannot open %s\n", dst);
		std::exit(1);
	}

	std::size_t srcsz = fileSize(fpsrc);
	std::fwrite(&srcsz, sizeof(srcsz), 1, fpdst);
	
	// constexpr std::size_t bufsz = 4 * 1024;
	// unsigned char buf[bufsz]; // 4k
	
	std::size_t nread;
	BigUInt<KeyBits> plainBuff;
	for (;;) {
		plainBuff = 0;
		nread = std::fread(plainBuff.data().data(), 1, PlainUnitBytes, fpsrc);
		if (nread < PlainUnitBytes) {
			if (std::ferror(fpsrc)) {
				std::fprintf(stderr, "fread error\n");
				std::exit(2);
			} else {
				if (nread == 0)
					break;
			}
		}

		auto encrypted = modularExp(plainBuff, key.first, key.second);
		if (std::fwrite(encrypted.data().data(), 1, CipherUnitBytes, fpdst) != CipherUnitBytes) {
			std::fprintf(stderr, "fwrite error\n");
			std::exit(2);
		}
	}

	std::fclose(fpsrc);
	std::fclose(fpdst);
}

void decrypt(const char* src, const char* dst, const KeyPair& key)
{
	std::FILE* fpsrc = std::fopen(src, "rb");
	if (!fpsrc) {
		std::fprintf(stderr, "cannot open %s\n", src);
		std::exit(3);
	}

	std::FILE* fpdst = std::fopen(dst, "wb");
	if (!fpdst) {
		std::fprintf(stderr, "cannot open %s\n", dst);
		std::exit(3);
	}

	std::size_t dstsz;
	if (std::fread(&dstsz, sizeof(std::size_t), 1, fpsrc) != 1) {
		std::fprintf(stderr, "cannot read original file size\n");
		std::exit(3);
	}

	std::size_t nread;
	BigUInt<KeyBits> cipherBuff;
	for (;;) {
		cipherBuff = 0;
		nread = std::fread(cipherBuff.data().data(), 1, CipherUnitBytes, fpsrc);
		if (nread < CipherUnitBytes) {
			if (std::ferror(fpsrc)) {
				std::fprintf(stderr, "fread error\n");
				std::exit(3);
			} else {
				if (nread == 0)
					break;
				else {
					std::fprintf(stderr, "format error\n");
					std::exit(3);
				}
			}
		}

		std::size_t nwrite;
		if (dstsz >= PlainUnitBytes) {
			nwrite = PlainUnitBytes;
		} else {
			nwrite = dstsz;
		}
		dstsz -= nwrite;
		
		auto decrypted = modularExp(cipherBuff, key.first, key.second);
		if (std::fwrite(decrypted.data().data(), 1, nwrite, fpdst) != nwrite) {
			std::fprintf(stderr, "fwrite error\n");
			std::exit(3);
		}
	}

	std::fclose(fpsrc);
	std::fclose(fpdst);
}

std::size_t fileSize(std::FILE* fp)
{
	auto curr = std::ftell(fp);
	std::fseek(fp, 0, SEEK_END);
	auto size = std::ftell(fp);
	std::fseek(fp, curr, SEEK_SET);

	return size;
}

KeyPair readKey(const char* keyfile)
{
	std::FILE* fpkey = std::fopen(keyfile, "rb");
	if (!fpkey) {
		std::fprintf(stderr, "cannot open %s\n", keyfile);
		std::exit(1);
	}

	BigUInt<KeyBits> e, n;
	long cnt;
	cnt = std::fread(e.data().data(), sizeof(uint32_t),
					 e.data().size(), fpkey);
	if (cnt != e.data().size()) {
		std::fprintf(stderr, "cannot read part1 of  key from %s\n", keyfile);
		std::exit(1);
	}
	cnt = std::fread(n.data().data(), sizeof(uint32_t),
					 n.data().size(), fpkey);
	if (cnt != e.data().size()) {
		std::fprintf(stderr, "cannot read part2 of key from %s\n", keyfile);
		std::exit(1);
	}

	std::fclose(fpkey);
	return {std::move(e), std::move(n)};
}
