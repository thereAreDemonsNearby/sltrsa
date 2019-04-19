CXX = g++
BITLEN = 2048
all: sltrsa sltrsa_keygen
sltrsa: sltrsa.cpp biguint.hpp ntalgo.hpp
	$(CXX) -O2 -std=c++17 -o bin/sltrsa sltrsa.cpp fullMultiply_alter.cpp  -pthread -lfmt -mavx2
sltrsa-debug: sltrsa.cpp biguint.hpp ntalgo.hpp
	$(CXX) -Og -g -std=c++17 -o bin/sltrsa-debug sltrsa.cpp fullMultiply_alter.cpp  -pthread -lfmt -mavx2
sltrsa_keygen: keyGen.cpp biguint.hpp ntalgo.hpp primegen.hpp
	$(CXX) -O2 -std=c++17 -o bin/sltrsa_keygen keyGen.cpp fullMultiply_alter.cpp -pthread -lfmt -mavx2
sltrsa_gprof: sltrsa.cpp biguint.hpp ntalgo.hpp
	$(CXX) -pg -O2 -std=c++17 -o profile/sltrsa sltrsa.cpp fullMultiply_alter.cpp -pthread -lfmt -mavx2
sltrsa_keygen_gprof: keyGen.cpp biguint.hpp ntalgo.hpp primegen.hpp
	$(CXX) -pg -O2 -std=c++17 -o profile/sltrsa_keygen keyGen.cpp fullMultiply_alter.cpp -pthread -lfmt -mavx2
fullMultiply_par_detail.o: fullMultiply_par_detail.h fullMultiply_par_detail.cpp
	$(CXX) -mavx2 -g -std=c++17 -c -o fullMultiply_par_detail.o fullMultiply_par_detail.cpp

mulspeed:
	$(CXX) -DTestBitLength=$(BITLEN) -O2 -std=c++17 -mavx2 -pthread -lfmt -o test/mulspeed test/testSpeedOfDifferentMultAlgo.cpp fullMultiply_alter.cpp

primegenspeed:
	$(CXX) -O2 -std=c++17 -pthread -mavx2 -lfmt -o test/primegenspeed test/testPrimegenSpeed.cpp

millerRabinTimes:
	$(CXX) -DTestBitLength=$(BITLEN) -O2 -std=c++17 -lfmt -o test/millerRabinTimes test/testMillerRabinTimes.cpp
