all: sltrsa sltrsa_keygen
sltrsa: sltrsa.cpp biguint.hpp ntalgo.hpp
	g++ -O2 -std=c++14 -o bin/sltrsa sltrsa.cpp
sltrsa_keygen: keyGen.cpp biguint.hpp ntalgo.hpp
	g++ -O2 -std=c++14 -o bin/sltrsa_keygen keyGen.cpp -pthread
