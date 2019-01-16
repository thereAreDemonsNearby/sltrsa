#ifndef PRIMEGEN_H__
#define PRIMEGEN_H__

#include "biguint.hpp"

constexpr size_t PrimeBits = 1024;

BigUInt<PrimeBits> primeGen(BigUInt<PrimeBits> beginning);
BigUInt<PrimeBits> primeGen_serial(BigUInt<PrimeBits> beginning);

#endif
