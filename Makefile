all: sltrsa sltrsa_keygen
sltrsa: sltrsa.cpp biguint.hpp ntalgo.hpp
	g++ -O2 -std=c++17 -o bin/sltrsa sltrsa.cpp -pthread -lfmt
sltrsa_keygen: keyGen.cpp biguint.hpp ntalgo.hpp primegen.hpp
	g++ -O2 -std=c++17 -o bin/sltrsa_keygen keyGen.cpp -pthread -lfmt
sltrsa_gprof: sltrsa.cpp biguint.hpp ntalgo.hpp
	g++ -pg -O2 -std=c++17 -o profile/sltrsa sltrsa.cpp -pthread -lfmt
sltrsa_keygen_gprof: keyGen.cpp biguint.hpp ntalgo.hpp primegen.hpp
	g++ -pg -O2 -std=c++17 -o profile/sltrsa_keygen keyGen.cpp -pthread -lfmt
fullMultiply_par_detail.o: fullMultiply_par_detail.h fullMultiply_par_detail.cpp
	g++ -mavx2 -g -std=c++17 -c -o fullMultiply_par_detail.o fullMultiply_par_detail.cpp
