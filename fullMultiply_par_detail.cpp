#include <cassert>
#include "fullMultiply_par_detail.h"
#include <x86intrin.h>
#include <iostream>
#include <fmt/format.h>
ParMulCtx::ParMulCtx(std::vector<uint32_t> const& l,
		     std::vector<uint32_t> const& r,
		     int tn, std::size_t buflen)
    : lhs(l), rhs(r), threadNum(tn),
      buffers(tn, std::vector<uint32_t>(buflen, 0))/*,
      condvars(tn)*/ {}

static bool isOdd(int a) { return a & 1 != 0; }

static void
addInPlace(std::vector<uint32_t>& lhs,
	   std::vector<uint32_t> const& rhs, std::size_t from = 0)
{
    assert(lhs.size() == rhs.size());
    std::size_t sz = lhs.size();
    uint64_t carry = 0;
    uint64_t mask = 0xffffffff;
    for (std::size_t i = from; i < sz; ++i) {
	uint64_t sum = static_cast<uint64_t>(lhs[i])
            + rhs[i] + carry;
	lhs[i] = sum & mask;
	carry = (sum & (~mask)) > 0 ? 1 : 0;
    }
    //assert(carry = 0);
}

void simdMulThread(ParMulCtx& ctx,
		   int id,
		   std::size_t idxBegin, std::size_t idxEnd)
{
    constexpr uint64_t mask = 0xffffffff;
    std::vector<uint32_t>& buffer = ctx.buffers[id];
    // fmt::print("bfsz: {0}  id: {1}  begin: {2}  end: {3}\n", buffer.size(), id, idxBegin, idxEnd);
    auto idx = idxBegin;

    __m256i permIdx = _mm256_setr_epi32(0, 4, 1, 5, 2, 6, 3, 7);
    __m256i loadmask = _mm256_setr_epi32(-1, -1, -1, -1, 0, 0, 0, 0);
    for (; idx < idxEnd; ++idx) {
	uint32_t carry = 0;
	__m256i mtor = _mm256_set1_epi32(ctx.rhs[idx]);
	std::size_t j;
	for (j = 0; j + 3 < ctx.lhs.size(); j += 4) {
            __m256i mend = _mm256_maskload_epi32(reinterpret_cast<int32_t const*>(ctx.lhs.data() + j),
                                                 loadmask);
            mend = _mm256_permutevar8x32_epi32(mend, permIdx);            
	    __m256i res = _mm256_mul_epu32(mtor, mend);            
	    auto resPtr = (uint64_t*) &res;
	    
	    for (std::size_t k = 0; k < 4; ++k) {
		uint64_t tmp = static_cast<uint64_t>(buffer[idx + j + k])
		    + resPtr[k] + carry;
		buffer[idx + j + k] = tmp & mask;
		carry = (tmp >> 16) >> 16;
	    }
	}

	for (; j < ctx.lhs.size(); ++j) {
	    uint64_t tmp = static_cast<uint64_t>(buffer[idx + j])
		+ ctx.lhs[j] * static_cast<uint64_t>(ctx.rhs[idx]) + carry;
	    buffer[idx + j] = tmp & mask;
	    carry = (tmp >> 16) >> 16;
	}

	buffer[idx + j] += carry;       
    }

    // int factor = 1;
    // int pseudoId = id;
    // while (1) {
    //     if (isOdd(pseudoId)) {
    //         std::unique_lock lck(ctx.condvars[id].mut);
    //         ctx.condvars[id].ready = true;
    //         lck.unlock();
    //         ctx.condvars[id].cv.notify_one();
    //         return;
    //     } else {
    //         int peerId = id + factor;
    //         // id counts from 0
    //         if (peerId >= ctx.threadNum) {
    //     	// no peer.
    //     	std::unique_lock lck(ctx.condvars[id].mut);
    //     	ctx.condvars[id].ready = true;
    //     	lck.unlock();
    //     	ctx.condvars[id].cv.notify_one();
    //     	return;
    //         } else {
    //     	std::unique_lock lck(ctx.condvars[peerId].mut);
    //     	ctx.condvars[peerId].cv.wait(lck, [&ctx, peerId]() {
    //                 return ctx.condvars[peerId].ready;
    //             });
    //             addInPlace(buffer, ctx.buffers[peerId]);
    //         }
    //     }

    //     factor *= 2;
    //     pseudoId /= 2;
    // }
}
