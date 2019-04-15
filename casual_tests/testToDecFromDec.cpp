#include "../biguint.hpp"

int main()
{
    for (int i = 0; i != 10000; ++i) {
	auto p = BigUInt<1024>::randomGen();
	auto q = BigUInt<1024>::fromDec(p.toDec());
	if (p != q) {
	    throw 0;
	}
    }
}
