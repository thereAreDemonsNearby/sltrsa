#include <fmt/format.h>
#include <fmt/ostream.h>
#include <fstream>
#include <cstdlib>
#include <utility>
#include <cstring>
#include <string>
#include <cstring>
#include <boost/program_options.hpp>
#include "TimerGuard.h"
#include "core.hpp"

template<std::size_t B>
rsa::PublicKey<B> extractPublicKey(rsa::PrivateKey<B> const& k)
{
    rsa::PublicKey<B> pub;
    pub.n = k.n;
    pub.e = k.e;
    return pub;
}

template<std::size_t B>
void hybridEncryptFile(rsa::PublicKey<B>& key, std::istream& is,
                       std::ostream& os);
template<std::size_t B>
void hybridDecryptFile(rsa::PrivateKey<B>& key, std::istream& is,
                       std::ostream& os);
template<std::size_t B>
void signFile(rsa::PrivateKey<B>& key, std::istream& is,
              std::ostream& os);
template<std::size_t B>
void verifyFile(rsa::PublicKey<B>& key, std::istream& fis,
                std::vector<uint8_t>& signature);

std::vector<uint8_t> parseDigest(std::string const& str);

template<std::size_t B>
void speedTest();

int main(int argc, char* argv[])
{
    if (argc <= 1 || strcmp(argv[1], "help") == 0) {
        fmt::print(stderr, "help informations(TODO)\n");
        return 1;
    }
    
    namespace bpo = boost::program_options;

    bpo::options_description opts("all options");
    bpo::variables_map varMap;
    opts.add_options()
        ("keyname", bpo::value<std::string>(), "name of private key to generate")
        ("par", bpo::value<int>(), "number of threads")
        ("keylen", bpo::value<std::size_t>(), "length of rsa key")
        ("dec", "decrypt")
        ("key", bpo::value<std::string>(), "the rsa key file")
        ("in", bpo::value<std::string>(), "input file")
        ("out", bpo::value<std::string>(), "output file")
        ("check", "check the digest")
        ("file", bpo::value<std::string>(), "the original file")
        ("dgst", bpo::value<std::string>(), "the digest file")
        ("verify", "verify the signature")
        ("signature", bpo::value<std::string>(), "the signature file");
    try {
        bpo::store(bpo::parse_command_line(argc-1, argv+1, opts,
                                           bpo::command_line_style::allow_long_disguise
                                           | bpo::command_line_style::long_allow_next),
                   varMap);
    } catch (std::exception& exc) {
        fmt::print(stderr, "error: {}\n", exc.what());
        std::exit(50);
    }

    if (argc <= 1 || strcmp(argv[1], "help") == 0) {
        fmt::print(stderr, "help informations(TODO)\n");
    } else if (strcmp(argv[1], "keygen") == 0) {
        if (!varMap.count("keyname")) {
            fmt::print(stderr, "no key name specified\n");
            std::exit(51);
        }
        std::string keyName = varMap["keyname"].as<std::string>();
        int threadNum = 1;
        if (varMap.count("par")) {
            threadNum = varMap["par"].as<int>();
        }
        if (threadNum <= 0) {
            fmt::print(stderr, "invalid thread num: {}\n", threadNum);
            std::exit(54);
        }
        std::size_t keyLen = 2048;
        if (varMap.count("keylen")) {
            keyLen = varMap["keylen"].as<std::size_t>();
        }
        if (keyLen != 1024 && keyLen != 2048 && keyLen != 4096) {
            fmt::print(stderr, "unsupported key length: {}(supported:1024,2048,4096)\n", keyLen);
            std::exit(53);
        }
        std::ofstream publicKeyFileStrm(keyName+".pub");
        std::ofstream privateKeyFileStrm(keyName);
        if (keyLen == 1024) {
            rsa::PrivateKey<1024> priv = rsa::keyGen<1024>(threadNum);
            rsa::PublicKey<1024> pub = extractPublicKey(priv);
            rsa::writePublicKey(publicKeyFileStrm, pub);
            rsa::writePrivateKey(privateKeyFileStrm, priv);
        } else if (keyLen == 2048) {
            rsa::PrivateKey<2048> priv = rsa::keyGen<2048>(threadNum);
            rsa::PublicKey<2048> pub = extractPublicKey(priv);
            rsa::writePublicKey(publicKeyFileStrm, pub);
            rsa::writePrivateKey(privateKeyFileStrm, priv);
        } else {
            rsa::PrivateKey<4096> priv = rsa::keyGen<4096>(threadNum);
            rsa::PublicKey<4096> pub = extractPublicKey(priv);
            rsa::writePublicKey(publicKeyFileStrm, pub);
            rsa::writePrivateKey(privateKeyFileStrm, priv);
        }
    } else if (strcmp(argv[1], "enc") == 0) {
        bool dec = false;
        std::istream* pis;
        std::ostream* pos;
        std::ifstream ifs;
        std::ofstream ofs;
        std::ifstream kfs;
        if (varMap.count("dec")) {
            dec = true;
        }
        if (!varMap.count("key")) {
            fmt::print(stderr, "no key specified\n");
            std::exit(55);
        }
        kfs.open(varMap["key"].as<std::string>());
        if (!kfs) {
            fmt::print(stderr, "can't open file {}\n",
                       varMap["key"].as<std::string>());
            std::exit(62);
        }
        if (varMap.count("in")) {
            ifs.open(varMap["in"].as<std::string>(), std::ios::binary);
            if (!ifs) {
                fmt::print(stderr, "can't open file {}\n",
                           varMap["in"].as<std::string>());
                std::exit(62);
            }
            pis = &ifs;
        } else {
            pis = &std::cin;
        }
        if (varMap.count("out")) {
            ofs.open(varMap["out"].as<std::string>(), std::ios::binary);
            pos = &ofs;
        } else {
            pos = &std::cout;
        }
        auto keyRawOpt = rsa::readKeyFile(kfs);
        if (!keyRawOpt) {
            fmt::print(stderr, "invalid key file\n");
            std::exit(59);
        }
        auto keyRaw = std::move(keyRawOpt.value());
        if (!dec) {
            // encryption
            if (keyRaw.type == rsa::KeyRaw::Private) {
                fmt::print(stderr, "private key shouldn't be used for encryption\n");
                std::exit(56);
            }
            auto keyLen = keyRaw.numbers[0].size() * 8;
            if (keyLen == 1024) {
                auto pubk = rsa::keyRawToPublicKey<1024>(keyRaw);
                hybridEncryptFile(pubk, *pis, *pos);
            } else if (keyLen == 2048) {
                auto pubk = rsa::keyRawToPublicKey<2048>(keyRaw);
                hybridEncryptFile(pubk, *pis, *pos);
            } else if (keyLen == 4096) {
                auto pubk = rsa::keyRawToPublicKey<4096>(keyRaw);
                hybridEncryptFile(pubk, *pis, *pos);
            } else {
                fmt::print(stderr, "unsupported key length: {}(supported:1024,2048,4096)\n", keyLen);
                std::exit(57);
            }
        } else {
            // decryption
            if (keyRaw.type == rsa::KeyRaw::Public) {
                fmt::print(stderr, "public key shouldn't be used for decryption\n");
                std::exit(56);
            }
            auto keyLen = keyRaw.numbers[0].size() * 8;
            if (keyLen == 1024) {
                auto privk = rsa::keyRawToPrivateKey<1024>(keyRaw);
                hybridDecryptFile(privk, *pis, *pos);
            } else if (keyLen == 2048) {
                auto privk = rsa::keyRawToPrivateKey<2048>(keyRaw);
                hybridDecryptFile(privk, *pis, *pos);                
            } else if (keyLen == 4096) {
                auto privk = rsa::keyRawToPrivateKey<4096>(keyRaw);
                hybridDecryptFile(privk, *pis, *pos);                
            } else {
                fmt::print(stderr, "unsupported key length: {}(supported:1024,2048,4096)\n", keyLen);
                std::exit(58);
            }
        }
    } else if (strcmp(argv[1], "dgst") == 0) {
        bool check = false;
        if (varMap.count("check")) {
            check = true;
        }
        if (!check) {
            // do digest
            std::vector<uint8_t> digest;
            std::istream* pis = &std::cin;
            std::ostream* pos = &std::cout;
            std::ifstream ifs;
            std::ofstream ofs;
            if (varMap.count("file")) {
                std::string fileName = varMap["file"].as<std::string>();
                ifs.open(fileName, std::ios::binary);
                if (!ifs) {
                    fmt::print(stderr, "can't open file {}\n", fileName);
                    std::exit(56);
                }
                pis = &ifs;
            }
            if (varMap.count("dgst")) {
                ofs.open(varMap["dgst"].as<std::string>());
                pos = &ofs;
            }
            sha::fileDigest_sha256(std::istreambuf_iterator<char>(*pis),
                                   std::istreambuf_iterator<char>(), std::back_inserter(digest));
            for (uint8_t e : digest) {
                fmt::print(*pos, "{:02x}", e);
            }
            fmt::print(*pos, "\n");
            
        } else {
            // check
            std::ifstream fs, ds;
            std::string fileName, dgstName;
            if (!varMap.count("file")) {
                fmt::print(stderr, "no file name specified\n");
                std::exit(58);
            }
            fileName = varMap["file"].as<std::string>();
            fs.open(fileName, std::ios::binary);
            if (!fs) {
                fmt::print(stderr, "can't open file {}\n", fileName);
                std::exit(65);
            }
            if (!varMap.count("dgst")) {
                fmt::print(stderr, "no dgst name specified\n");
                std::exit(58);
            }
            dgstName = varMap["dgst"].as<std::string>();
            ds.open(dgstName);
            if (!ds) {
                fmt::print(stderr, "can't open file {}\n", dgstName);
                std::exit(65);
            }
            std::string digestStr;
            if (!std::getline(ds, digestStr)) {
                fmt::print(stderr, "digest format error\n");
                std::exit(70);
            }
            if (!util::noMoreData(ds)) {
                fmt::print(stderr, "digest format error\n");
                std::exit(70);                
            }
            std::vector<uint8_t> dgstRead = parseDigest(digestStr);
            std::vector<uint8_t> dgst;
            sha::fileDigest_sha256(std::istreambuf_iterator<char>(fs),
                                   std::istreambuf_iterator<char>(),
                                   std::back_inserter(dgst));
            if (dgstRead == dgst) {
                fmt::print(stderr, "checked ok\n");
            } else {
                fmt::print(stderr, "check failed\n");
                std::exit(1);
            }        
        }
    } else if (strcmp(argv[1], "sign") == 0) {
        bool verify = false;
        std::string fileName;
        std::string signName;
        std::ifstream kfs;
        if (varMap.count("verify")) {
            verify = true;
        }
        if (!varMap.count("key")) {
            fmt::print(stderr, "no key specified\n");
            std::exit(55);
        }
        kfs.open(varMap["key"].as<std::string>());
        if (!kfs) {
            fmt::print(stderr, "can't open file {}\n",
                           varMap["key"].as<std::string>());
            std::exit(62);
        }
        if (!varMap.count("file")) {
            fmt::print(stderr, "no file to be signed\n");
            std::exit(60);
        }
        fileName = varMap["file"].as<std::string>();
        if (!varMap.count("signature")) {
            fmt::print(stderr, "no signature name specified\n");
            std::exit(61);
        }
        signName = varMap["signature"].as<std::string>();
        auto keyRawOpt = rsa::readKeyFile(kfs);
        if (!keyRawOpt) {
            fmt::print(stderr, "invalid key file\n");
            std::exit(59);
        }
        auto keyRaw = keyRawOpt.value();
        if (!verify) {
            // sign
            if (keyRaw.type == rsa::KeyRaw::Public) {
                fmt::print(stderr, "public key shouldn't be used for signing\n");
                std::exit(56);
            }
            std::ifstream ifs(fileName, std::ios::binary);
            if (!ifs) {
                fmt::print(stderr, "can't open file {}\n", fileName);
                std::exit(62);
            }
            std::ofstream ofs(signName, std::ios::binary);
            auto keyLen = keyRaw.numbers[0].size() * 8;
            if (keyLen == 1024) {
                auto priv = rsa::keyRawToPrivateKey<1024>(keyRaw);
                signFile(priv, ifs, ofs);
            } else if (keyLen == 2048) {
                auto priv = rsa::keyRawToPrivateKey<2048>(keyRaw);
                signFile(priv, ifs, ofs);
            } else if (keyLen == 4096) {
                auto priv = rsa::keyRawToPrivateKey<4096>(keyRaw);
                signFile(priv, ifs, ofs);
            } else {
                fmt::print(stderr, "unsupported key length: {}(supported:1024,2048,4096)\n", keyLen);
                std::exit(58);
            }
        } else {
            // verify
            if (keyRaw.type == rsa::KeyRaw::Private) {
                fmt::print(stderr, "public key shouldn't be used for signature check\n");
                std::exit(56);
            }
            std::ifstream ifs(fileName, std::ios::binary);
            std::ifstream sfs(signName, std::ios::binary);
            if (!ifs) {
                fmt::print(stderr, "can't open file {}\n", fileName);
                std::exit(62);
            }
            if (!sfs) {
                fmt::print(stderr, "can't open file {}\n", signName);
                std::exit(62);
            }
            
            auto keyLen = keyRaw.numbers[0].size() * 8;
            if (keyLen == 1024) {
                std::vector<uint8_t> signature(1024/8);
                if (sfs.read((char*)signature.data(), signature.size())
                    .gcount() < signature.size()) {
                    fmt::print(stderr, "the size of the signature file is inconsistent with the key size\n");
                    std::exit(64);
                }
                auto pub = rsa::keyRawToPublicKey<1024>(keyRaw);
                verifyFile(pub, ifs, signature);
            } else if (keyLen == 2048) {
                std::vector<uint8_t> signature(2048/8);
                if (sfs.read((char*)signature.data(), signature.size())
                    .gcount() < signature.size()) {
                    fmt::print(stderr, "the size of the signature file is inconsistent with the key size\n");
                    std::exit(64);
                }
                auto pub = rsa::keyRawToPublicKey<2048>(keyRaw);
                verifyFile(pub, ifs, signature);
            } else if (keyLen == 4096) {
                std::vector<uint8_t> signature(4096/8);
                if (sfs.read((char*)signature.data(), signature.size())
                    .gcount() < signature.size()) {
                    fmt::print(stderr, "the size of the signature file is inconsistent with the key size\n");
                    std::exit(64);
                }
                auto pub = rsa::keyRawToPublicKey<4096>(keyRaw);
                verifyFile(pub, ifs, signature);
            } else {
                fmt::print(stderr, "unsupported key length: {}(supported:1024,2048,4096)\n", keyLen);
                std::exit(58);
            }
        }

    } else if (strcmp(argv[1], "speed") == 0) {
        fmt::print("Test signing times in 10s:\n");
        speedTest<1024>();
        speedTest<2048>();
        speedTest<4096>();
    } else {
        fmt::print(stderr, "help informations(TODO)\n");
    }

    
}

template<std::size_t B>
void hybridEncryptFile(rsa::PublicKey<B>& key, std::istream& is,
                       std::ostream& os)
{
    uint8_t aes128Key[128/8];
    std::vector<uint8_t> keyEnc(B/8);
    rsa::encrypt(key, std::begin(aes128Key), std::end(aes128Key), keyEnc.begin());
    os.write((char*)keyEnc.data(), keyEnc.size());
    aes::encryptFile_aes128_CBC(is, os, aes128Key);
}

template<std::size_t B>
void hybridDecryptFile(rsa::PrivateKey<B>& key, std::istream& is,
                       std::ostream& os)
{
    uint8_t aes128Key[128/8];
    std::vector<uint8_t> keyEnc(B/8);
    is.read((char*)keyEnc.data(), B/8);
    if (is.gcount() < B/8) {
        fmt::print("file format error; maybe it's not an encrypted file\n");
        std::exit(1);
    }
    util::Error e =
        rsa::decrypt(key, keyEnc.begin(), keyEnc.end(), std::begin(aes128Key)).first;
    if (e == util::Error::FormatError) {
        fmt::print("file format error; maybe it's not an encrypted file\n");
        std::exit(1);
    }

    aes::decryptFile_aes128_CBC(is, os, aes128Key);
}

template<std::size_t B>
void signFile(rsa::PrivateKey<B>& key, std::istream& is,
              std::ostream& os)
{
    // use sha256
    std::vector<uint8_t> hash(32);    
    util::Error e = rsa::sign(key, std::istreambuf_iterator<char>(is),
                         std::istreambuf_iterator<char>(),
                         std::ostreambuf_iterator<char>(os)).first;
    if (e != util::Error::Ok) {
        fmt::print("file signing error: {}\n",
                   util::errorToString[(int)e]);
    }
}

template<std::size_t B>
void verifyFile(rsa::PublicKey<B>& key, std::istream& fis,
                std::vector<uint8_t>& signature)
{
    util::Error e = rsa::verify(key, std::istreambuf_iterator<char>(fis),
                                std::istreambuf_iterator<char>(),
                                signature.begin(),
                                signature.end());
    if (e == util::Error::Ok) {
        fmt::print("verified ok\n");
    } else if (e == util::Error::HashError) {
        fmt::print("verification failed\n");
        std::exit(2);
    } else if (e == util::Error::FormatError) {
        fmt::print("verification failed\n");
        std::exit(1);
    }
}

std::vector<uint8_t> parseDigest(std::string const& str)
{
    auto toHex = [](char a) {
        if (a >= '0' && a <= '9') {
            return a-'0';
        } else if (a >= 'a' && a <= 'f') {
            return a-'a'+10;
        } else {
            fmt::print(stderr, "digest format error\n");
            std::exit(70);
        }
    };
        
    auto two2one = [toHex](char a, char b) {
        return toHex(a) * 0x10 + toHex(b);
    };

    if (str.size() % 2 != 0) {
        fmt::print(stderr, "digest format error\n");
        std::exit(70);
    }

    std::vector<uint8_t> dgst;
    for (int i = 0; i + 1 < str.size(); i += 2) {
        dgst.push_back(two2one(str[i], str[i+1]));
    }
    return dgst;
}

template<std::size_t B>
void speedTest()
{
    util::Error e;
    rsa::PrivateKey<B> key = rsa::keyGen<B>(6);
    std::vector<uint8_t> msg(250);
    util::randomGenBytes(msg.begin(), msg.end());
    std::vector<uint8_t> hashVal(256/8);
    sha::fileDigest_sha256(msg.begin(), msg.end(), hashVal.begin());
    GNKCtx<B/2> pCtx(key.p), qCtx(key.q);
    size_t cnt = 0;
    double tm;
    {
        TimerGuard tg("", TimerGuard::Delay{}, std::cerr);
        while (tg.sum() < 10.0) {
            tg.resume();
            cnt++;
            std::vector<uint8_t> pss(B/8, 0);
            util::PSSEncode(hashVal.begin(), hashVal.end(), pss.begin(), B/8, 16);    
            BigUInt<B> pssBi = rsa::bytesToBigUInt<B>(pss.begin(), pss.end());
            std::array<uint8_t, B/8> bytes;
            // BigUInt<B> enc = rsa::decryptUsingChineseRemainderTheorem(
            //     pssBi, key, GNKCtx<B/2>(key.p), GNKCtx<B/2>(key.q));
            BigUInt<B> enc = rsa::decryptUsingChineseRemainderTheorem(
                pssBi, key, pCtx, qCtx);
            rsa::BigUIntToBytes(enc, bytes.begin());
            tg.stop();
        }
        tm = tg.sum();
    }
    fmt::print(stderr, "do rsa-{0} signature {1} times in {2} seconds\n", B, cnt, tm);
}
