all: sltrsa sltrsa_keygen
sltrsa: sltrsa.cpp biguint.hpp ntalgo.hpp
	g++ -O2 -std=c++17 -o bin/sltrsa sltrsa.cpp -pthread -lfmt
sltrsa_keygen: keyGen.cpp biguint.hpp ntalgo.hpp primegen.hpp
	g++ -O2 -std=c++17 -o bin/sltrsa_keygen keyGen.cpp -pthread -lfmt
