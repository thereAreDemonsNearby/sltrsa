#include <iostream>
#include <vector>
#include <string>

int main(int argc, char** argv)
{
	bool sieve[1000000];
	std::fill(sieve, sieve + 1000000, true);
	for (int i = 2; i <= 1000; ++i) {
		if (sieve[i]) {
			for (int j = i+i; j < 1000000; j = j+i) {
				sieve[j] = false;			   
			}
		}
	}

	std::vector<int> primes;
	for (int i = 2; i <= std::stoi(argv[1]); ++i) {
		if (sieve[i]) {
			primes.push_back(i);
		}
	}

	int cnt = 0;
	std::cout << "const unsigned smallPrimes[] = {\n\t";
	for (auto& item : primes) {
		std::cout << item << ", ";
		cnt++;
		if (cnt == 15) {
			std::cout << "\n\t";
			cnt = 0;
		}
	}
	std::cout << " };\n";
}
