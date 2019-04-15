#include "../biguint.hpp"
#include <iostream>

int main()
{
    BigUInt<960000> f0 = 0;
    BigUInt<960000> f1 = 1;
    BigUInt<960000> res;
    for (int i = 0; i < 1000000-1; ++i) {
	res = f0 + f1;
	f0 = f1;
	f1 = res;
    }

    std::cout << res.toDec() << '\n';
}
