#include <fmt/format.h>
#include "../ntalgo.hpp"
#include "../MontMul_alter.hpp"

int main()
{
    BigUInt<256> a = BigUInt<256>::fromHex("fa5401a8593c981bfd42a2802a750928e930850d63bc2c5fda8d4ca9655091ad");
    fmt::print("a is \n{}\n", a.toHex());
    std::vector<uint64_t> rf = toRedundantForm(a, 29, 0x1fffffff);
    fmt::print("redundant form is \n");
    for (auto it = rf.rbegin(); it != rf.rend(); ++it) {
        fmt::print("{:x}|", *it);
    }
    fmt::print("\n");

    BigUInt<256> b = redundantFormToBase32<256>(rf, 29);
    fmt::print("b is {}\n", b.toHex());

    for (int i = 0; i < 10000; ++i) {
        BigUInt<1024> v = BigUInt<1024>::randomGen();
        BigUInt<1024> v2 = redundantFormToBase32<1024>(toRedundantForm(v,28,0x1fffffff), 28);
        if (v != v2) {
            fmt::print(stderr, "error\n");
            std::exit(1);
        }
    }
}
