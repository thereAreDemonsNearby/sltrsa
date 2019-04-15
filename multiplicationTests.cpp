#include "fullMultiply_alter.hpp"

constexpr std::size_t B = MacroB;

int main()
{
    BigUInt<B> a{1}, b{2};
    
    fullMultiply_comba(a, b);
}
