#include <fmt/format.h>
#include <fstream>
#include <cstdlib>
#include <utility>
#include <cstring>
#include <string>
#include "TimerGuard.h"
#include "core.hpp"

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

static std::size_t fileSize(std::FILE* fp)
{
    auto curr = std::ftell(fp);
    std::fseek(fp, 0, SEEK_END);
    auto size = std::ftell(fp);
    std::fseek(fp, curr, SEEK_SET);

    return size;
}


template<std::size_t KeyBits>
rsa::PublicKey<KeyBits> readPublicKey(std::ifstream& ifs)
{
    rsa::PublicKey<KeyBits> pk;
    std::string buf;
    std::getline(ifs, buf);
    std::getline(ifs, buf);
    pk.e = BigUInt<KeyBits>::fromDec(buf);
    std::getline(ifs, buf);
    std::getline(ifs, buf);
    pk.n = BigUInt<KeyBits>::fromDec(buf);
    return pk;
}

template<std::size_t KeyBits>
rsa::PrivateKey<KeyBits> readPrivateKey(std::ifstream& ifs)
{
    rsa::PrivateKey<KeyBits> pk;
    std::string buf;
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.d = BigUInt<KeyBits>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.n = BigUInt<KeyBits>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.p = BigUInt<KeyBits/2>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.q = BigUInt<KeyBits/2>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.pInv = BigUInt<KeyBits/2>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.qInv = BigUInt<KeyBits/2>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.d1 = BigUInt<KeyBits/2>::fromDec(buf);
    std::getline(ifs, buf);    std::getline(ifs, buf);
    pk.d2 = BigUInt<KeyBits/2>::fromDec(buf);
    return pk;
}

static bool Parallel = false;
static int ThreadNum = 1;

int main(int argc, char* argv[])
{
    std::ifstream keyFile;
    char const* keyFileName;
    std::FILE* src;
    std::FILE* dst;
    std::size_t srcSize;
    
    std::size_t idx = 1;
    if (idx < argc && std::strcmp(argv[idx], "--help") == 0) {
        fmt::print(stderr, "{} [-p ThreadNum] <key> [src] [dest]\n", argv[0]);
        std::exit(0);
    }
    
    if (idx < argc && std::strcmp(argv[idx], "-p") == 0) {
        // enable Parallel
        ++idx;
        Parallel = true;
        // read thread num
        std::size_t tn;
        if (idx < argc && toNumber(argv[idx], &tn)) {
            ++idx;
            ThreadNum = static_cast<int>(tn);            
        } else {
            fmt::print(stderr, "lack thread number after -p\n");
            std::exit(1);
        }
    } else {
        Parallel = false;
    }
    
    if (idx < argc) {
        keyFileName = argv[idx];
        keyFile.open(argv[idx], std::ios::in);
        if (!keyFile.is_open()) {
            std::string msg = fmt::format("cannot open key file {}", argv[idx]);
            std::perror(msg.c_str());
            std::exit(2);
        }
        ++idx;
    } else {
        fmt::print(stderr, "no key file specified\n");
        std::exit(3);
    }

    if (idx < argc) {
        if ((src = std::fopen(argv[idx], "rb")) == NULL) {
            auto msg = fmt::format("cannot open file {}", argv[idx]);
            std::perror(msg.c_str());
            std::exit(3);
        }
        ++idx;
        if (idx < argc) {
            if ((dst = std::fopen(argv[idx], "wb")) == NULL) {
                auto msg = fmt::format("cannot open file {}", argv[idx]);
                std::perror(msg.c_str());
                std::exit(4);
            }
            ++idx;
            if (idx < argc) {
                fmt::print(stderr, "too much argument\n");
                std::exit(5);
            }
        } else {
            dst = stdout;
        }
    } else {
        src = stdin;
        dst = stdout;
    }

    std::size_t keyBits;
    std::string line;
    if (std::getline(keyFile, line)) {
        if (line.substr(0, 11) == "----SLTRSA-") {
            keyBits = std::stoul(line.substr(11));
        } else {
            fmt::print(stderr, "{} is not a valid key file\n", keyFileName);
            std::exit(6);
        }
    } else {
        fmt::print(stderr, "{} is not a valid key file\n", keyFileName);
        std::exit(6);
    }

    std::getline(keyFile, line);
    if (line == "----PublicKey----") {
        if (keyBits == 1024) {
            auto pk = readPublicKey<1024>(keyFile);
            rsa::encryptFile<1024>(src, dst, pk, ThreadNum);
        } else if (keyBits == 2048) {
            auto pk = readPublicKey<2048>(keyFile);
            rsa::encryptFile<2048>(src, dst, pk, ThreadNum);
        } else {
            assert(keyBits == 4096);
            auto pk = readPublicKey<4096>(keyFile);
            rsa::encryptFile<4096>(src, dst, pk, ThreadNum);
        }
    } else if (line == "----PrivateKey----") {
        if (keyBits == 1024) {
            auto pk = readPrivateKey<1024>(keyFile);
            rsa::decryptFile<1024>(src, dst, pk, ThreadNum);
        } else if (keyBits == 2048) {
            auto pk = readPrivateKey<2048>(keyFile);
            rsa::decryptFile<2048>(src, dst, pk, ThreadNum);
        } else {
            assert(keyBits == 4096);
            auto pk = readPrivateKey<4096>(keyFile);
            rsa::decryptFile<4096>(src, dst, pk, ThreadNum);
        }
    } else {
        fmt::print(stderr, "Unknown key type\n");
        std::exit(7);
    }
}

