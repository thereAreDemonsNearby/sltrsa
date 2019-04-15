#include <fmt/printf.h>
#include "../biguint.hpp"

int main()
{
    const size_t B1 = 1024;
    const size_t B2 = B1+32;
    for (int i = 0; i != 10000; ++i) {
	auto a = BigUInt<B1>::randomGen();
	auto b = BigUInt<B2>::randomGen();
	auto r1 = fullMultiply(a, b);
	auto r2 = a.resize<B1+B2>() * b.resize<B1+B2>();
	if (r1 != r2) {
	    fmt::print("failed. a={0}, b={1},\n r1={2}, r2={3}\n", a.toDec(), b.toDec(), r1.toDec(), r2.toDec());
	    return 1;
	} else {
	    fmt::print("all right\n");
	}
    }
}
