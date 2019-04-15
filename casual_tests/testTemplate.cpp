#include "biguint.hpp"
#include <iostream>
#include <type_traits>
using namespace std;

template<typename T>
void func(T, std::enable_if_t<hasDivide<T>::value>* = 0)
{
    cout << "call func a" << endl;
}

template<typename T>
void func(T, std::enable_if_t<!hasDivide<T>::value>* = 0)
{
    cout << "call func b" << endl;
}

int main()
{
    
    cout << hasDivide<int>::value << endl;
    cout << hasDivide<biguint<32>>::value << endl;
    int a;
    biguint<32> b;
    func(a);
    func(b);
}
