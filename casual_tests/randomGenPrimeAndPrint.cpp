#include <iostream>
#include "../primegen.hpp"

int main()
{
    std::cout << primeGen_par<4096>(6).toDec() << std::endl;
}
