#ifndef FULLMULTIPLY_PAR_DETAIL_H
#define FULLMULTIPLY_PAR_DETAIL_H

#include <cstdint>
#include <vector>
#include <condition_variable>
#include <mutex>

struct ParMulCtx
{
    struct CondVar
    {
	std::condition_variable cv;
	std::mutex mut;
	bool ready = false;
    };
    
    std::vector<uint32_t> const& lhs;
    std::vector<uint32_t> const& rhs;
    
    int threadNum;
    std::vector<std::vector<uint32_t>> buffers; // a buffer per thread
    // std::vector<CondVar> condvars;
    ParMulCtx(std::vector<uint32_t> const& l,
	      std::vector<uint32_t> const& r,
	      int tn, std::size_t buflen);
};

void simdMulThread(ParMulCtx& ctx,
		   int id,
		   std::size_t idxBegin, std::size_t idxEnd);

#endif
