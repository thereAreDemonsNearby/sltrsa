#include "../ntalgo.hpp"
#include <iostream>
#include <array>
int main()
{
    std::array<BigUInt<64>, 5> arr = {255, (uint64_t)UINT32_MAX, UINT64_MAX, 4294967296L, 0};
    for (auto& e : arr) {
	std::cout << e.toBitString() << std::endl;
	std::cout << significantBits(e) << std::endl;
    }
}
