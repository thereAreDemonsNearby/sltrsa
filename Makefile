CXX = g++
BITLEN = 2048
all: sltrsa sltrsa_keygen
sltrsa: sltrsa.cpp biguint.hpp ntalgo.hpp core.hpp core.cpp
	$(CXX) -O3 -std=c++17 -o bin/sltrsa sltrsa.cpp fullMultiply_alter.cpp core.cpp -pthread -lfmt -mavx2 -maes -lboost_program_options
sltrsa-debug: sltrsa.cpp biguint.hpp ntalgo.hpp core.hpp core.cpp
	$(CXX) -Og -g -std=c++17 -o bin/sltrsa-debug sltrsa.cpp fullMultiply_alter.cpp core.cpp  -pthread -lfmt -mavx2 -maes -lboost_program_options
sltrsa_gprof: sltrsa.cpp biguint.hpp ntalgo.hpp core.hpp core.cpp
	$(CXX) -pg -O2 -std=c++17 -o profile/sltrsa sltrsa.cpp fullMultiply_alter.cpp core.cpp -pthread -lfmt -mavx2 -maes -lboost_program_options

mulspeed:
	$(CXX) -DTestBitLength=$(BITLEN) -O2 -std=c++17 -mavx2 -pthread -lfmt -o test/mulspeed test/testSpeedOfDifferentMultAlgo.cpp fullMultiply_alter.cpp

primegenspeed:
	$(CXX) -O2 -std=c++17 -pthread -mavx2 -lfmt -o test/primegenspeed test/testPrimegenSpeed.cpp fullMultiply_alter.cpp

millerRabinTimes:
	$(CXX) -DTestBitLength=$(BITLEN) -O2 -std=c++17 -lfmt -o test/millerRabinTimes test/testMillerRabinTimes.cpp
