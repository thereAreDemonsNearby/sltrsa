#include <iostream>
#include <atomic>

int main()
{
    std::cout << std::boolalpha << std::atomic_bool::is_always_lock_free
              << " " << std::atomic_int::is_always_lock_free << "\n";
}
