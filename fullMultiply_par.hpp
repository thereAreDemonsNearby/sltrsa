#ifndef FULLMULTIPLY_PAR_HPP
#define FULLMULTIPLY_PAR_HPP

#include <thread>
#include <memory>
#include <mutex>
#include <condition_variable>
#include <atomic>
#include <x86intrin.h>
#include <fmt/format.h>
#include "biguint.hpp"
#include "fullMultiply_par_detail.h"

static void
addInPlace(std::vector<uint32_t>& lhs,
	   std::vector<uint32_t> const& rhs,
           std::size_t from = 0)
{
    assert(lhs.size() == rhs.size());
    std::size_t sz = lhs.size();
    // if (to == 0) to = sz;
    uint64_t carry = 0;
    uint64_t mask = 0xffffffff;
    for (std::size_t i = from; i < sz; ++i) {
	uint64_t sum = static_cast<uint64_t>(lhs[i])
            + rhs[i] + carry;
	lhs[i] = sum & mask;
	carry = (sum & (~mask)) > 0 ? 1 : 0;
    }

}

template <std::size_t B1, std::size_t B2>
BigUInt<B1 + B2>
fullMultiply_multithrd_simd(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs, int threadNum)
{
    std::size_t workNum = BigUInt<B1>::VLEN;
    std::size_t workLoad = workNum / threadNum;
    if (workLoad * threadNum != workNum)
        ++threadNum;
    ParMulCtx ctx(lhs.data(), rhs.data(), threadNum, BigUInt<B1 + B2>::VLEN);
    std::vector<std::thread> threads;
    std::size_t begin;
    int id = 0;
    for (begin = 0; begin + workLoad - 1 < workNum; begin += workLoad) {
        threads.push_back(std::thread(simdMulThread, std::ref(ctx), id, begin, begin+workLoad));
        ++id;
    }
    threads.push_back(std::thread(simdMulThread, std::ref(ctx), id, begin, workNum));

    for (auto& t : threads) {
        t.join();
    }

    BigUInt<B1 + B2> result;
    // result.data() = std::move(ctx.buffers[0]);
    for (auto& buf : ctx.buffers) {
        addInPlace(result.data(), buf);
    }
    return result;
}

template <std::size_t B1, std::size_t B2>
BigUInt<B1 + B2>
fullMultiply_simd(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs)
{
    BigUInt<B1 + B2> result;
    constexpr uint64_t mask = 0xffffffff;
    __m256i permIdx = _mm256_setr_epi32(0, 4, 1, 5, 2, 6, 3, 7);
    __m256i loadmask = _mm256_setr_epi32(-1, -1, -1, -1, 0, 0, 0, 0);
    for (std::size_t i = 0; i < BigUInt<B2>::VLEN; ++i) {
        std::uint32_t carry = 0;
        std::size_t j;
        __m256i mtor = _mm256_set1_epi32(rhs.data()[i]);
        for (j = 0; j + 3 < BigUInt<B1>::VLEN; j += 4) {
            __m256i mend = _mm256_maskload_epi32(reinterpret_cast<int32_t const*>(lhs.data().data()+j), loadmask);
            // __m256i mend = _mm256_setr_epi32(lhs.data()[j], 0, lhs.data()[j+1], 0, lhs.data()[j+2], 0, lhs.data()[j+3], 0);
            mend = _mm256_permutevar8x32_epi32(mend, permIdx);
            __m256i prod = _mm256_mul_epu32(mtor, mend);
            auto p = (uint64_t*) &prod;
            uint64_t sum;
            std::size_t idx = i + j;
            sum = static_cast<uint64_t>(result.data()[idx])
                + prod[0] + carry;                
            result.data()[idx++] = (sum & mask);
            carry = (sum >> 16) >> 16;
            sum = static_cast<uint64_t>(result.data()[idx])
                + prod[1] + carry;                
            result.data()[idx++] = (sum & mask);
            carry = (sum >> 16) >> 16;
            sum = static_cast<uint64_t>(result.data()[idx])
                + prod[2] + carry;
            result.data()[idx++] = (sum & mask);
            carry = (sum >> 16) >> 16;
            sum = static_cast<uint64_t>(result.data()[idx])
                + prod[3] + carry;                
            result.data()[idx] = (sum & mask);
            carry = (sum >> 16) >> 16;
        }
        
        for (; j < BigUInt<B1>::VLEN; ++j) {
            uint64_t sum = static_cast<uint64_t>(result.data()[i + j])
                + lhs.data()[j] * static_cast<uint64_t>(rhs.data()[i]) + carry;
            result.data()[i + j] = (sum & mask);
            carry = (sum >> 16) >> 16;
        }

        result.data()[i + j] += carry;
    }

    return result;
}

class FixedMulPool
{
private:
    struct Data
    {
        const int thrdNum;
        std::vector<uint32_t>* result = nullptr;
        std::vector<uint32_t> const* lhs = nullptr;
        std::vector<uint32_t> const* rhs = nullptr;
        std::vector<std::pair<std::size_t, std::size_t>> ranges;
        std::vector<std::vector<uint32_t>> buffers;

        bool readyToWork = false;
        std::condition_variable cvReadyToWork;
        std::mutex mutexReadyToWork;
        int numWorking = 0;

        std::condition_variable cvDone;
        std::mutex mutexDone;
        int numDone = 0;

        std::atomic_bool shouldExit;

        Data(int tn) : thrdNum(tn), ranges(tn), shouldExit(false), buffers(tn) {}
    };

    struct Worker
    {
        Data* data_;
        Worker(Data* d)
            : data_(d) {}
        
        void operator()(int id)
        {
            while (true) {
                {
                    std::unique_lock<std::mutex> lck(data_->mutexReadyToWork);
                    data_->cvReadyToWork.wait(lck, [d=data_](){ return d->readyToWork; });
                    ++data_->numWorking;
                    if (data_->numWorking == data_->thrdNum) {
                        data_->readyToWork = false;
                    }
                }

                if (data_->shouldExit)
                    return;

                auto len = data_->lhs->size();
                auto plhs = data_->lhs;
                auto prhs = data_->rhs;
                auto beg = data_->ranges[id].first;
                auto end = data_->ranges[id].second;
                std::vector<uint32_t>& buf = data_->buffers[id];

                constexpr uint64_t mask = 0xffffffff;
                uint32_t carry;
                for (std::size_t i = beg; i < end; ++i) {
                    carry = 0;
                    for (std::size_t j = 0; j < len; ++j) {
                        auto sum = buf[i+j]
                            + static_cast<uint64_t>((*plhs)[j]) * (*prhs)[i]
                            + carry;
                        static_assert(sizeof sum == 8);
                        buf[i+j] = sum & mask;
                        carry = (sum >> 16) >> 16;
                    }
                    buf[i + len] += carry;
                }   
                
                {
                    std::unique_lock<std::mutex> lck(data_->mutexDone);
                    ++data_->numDone;
                    if (data_->numDone == data_->thrdNum) {
                        lck.unlock();
                        data_->cvDone.notify_one();
                    }
                }
                std::this_thread::yield();
            } // end while
        }
    };

    Data data_;
    std::vector<std::thread> thrds_;

public:
    // can only accept tasks equal to threadNum
    FixedMulPool(int threadNum)
        : data_(threadNum)
    {
        for (int i = 0; i < threadNum; ++i) {
            thrds_.push_back(std::thread(Worker(&data_), i));
        }
    }

    ~FixedMulPool()
    {
        data_.shouldExit = true;
        std::unique_lock<std::mutex> lck(data_.mutexReadyToWork);
        data_.readyToWork = true;
        lck.unlock();
        data_.cvReadyToWork.notify_all();
        for (auto& t : thrds_) {
            t.join();
        }
    }

    void addRange(std::size_t idx, std::size_t b, std::size_t e) {
        data_.ranges[idx].first = b;
        data_.ranges[idx].second = e;
    }
    
    void start(std::vector<uint32_t> const& lhs, std::vector<uint32_t> const& rhs,
               std::vector<uint32_t>& res)
    {
        data_.lhs = &lhs;
        data_.rhs = &rhs;
        data_.result = &res;
        for (auto& b : data_.buffers) {
            b.resize(res.size());
            std::fill(b.begin(), b.end(), 0);
        }
        
        std::unique_lock<std::mutex> lck(data_.mutexReadyToWork);
        data_.readyToWork = true;
        lck.unlock();
        data_.cvReadyToWork.notify_all();
    }

    void stop()
    {
        data_.numDone = 0;
        data_.numWorking = 0;
        data_.readyToWork = false;
    }

    std::mutex& mutexDone()
    {
        return data_.mutexDone;
    }

    std::condition_variable& cvDone()
    {
        return data_.cvDone;
    }

    std::vector<std::vector<uint32_t>>& buffers() { return data_.buffers; }

    int numDone() { return data_.numDone; }

    int thrdNum() { return data_.thrdNum; }
};

class FixedSpinMulPool
{
private:
    struct Data
    {
        const int thrdNum;
        std::vector<uint32_t>* result = nullptr;
        std::vector<uint32_t> const* lhs = nullptr;
        std::vector<uint32_t> const* rhs = nullptr;
        std::vector<std::pair<std::size_t, std::size_t>> ranges;
        std::vector<std::vector<uint32_t>> buffers;

        std::vector<std::atomic_bool> ready;
        std::atomic_int numDone;       

        bool shouldExit;

        Data(int tn)
            : thrdNum(tn), ranges(tn), buffers(tn),
              ready(tn), numDone(0),
              shouldExit(false) {
            for (auto& atm : ready) {
                std::atomic_init(&atm, false);
            }
        }
    };

    struct Worker
    {
        Data* data_;
        Worker(Data* d)
            : data_(d) {}
        
        void operator()(int id)
        {
            while (true) {
                while (!data_->ready[id]) {
                    // std::this_thread::yield();
                }

                
                if (data_->shouldExit)
                    return;                

                auto len = data_->lhs->size();
                auto plhs = data_->lhs;
                auto prhs = data_->rhs;
                auto beg = data_->ranges[id].first;
                auto end = data_->ranges[id].second;
                std::vector<uint32_t>& buf = data_->buffers[id];
                
                buf.resize(plhs->size() + prhs->size());
                std::fill(buf.begin(), buf.end(), 0);

                constexpr uint64_t mask = 0xffffffff;
                uint64_t carry;
                for (std::size_t i = beg; i < end; ++i) {
                    carry = 0;
                    for (std::size_t j = 0; j < len; ++j) {
                        auto sum = buf[i+j]
                            + static_cast<uint64_t>((*plhs)[j]) * (*prhs)[i]
                            + carry;
                        static_assert(sizeof sum == 8);
                        buf[i+j] = sum & mask;
                        carry = (sum >> 16) >> 16;
                    }
                    buf[i + len] += carry;
                }
                data_->ready[id] = false;
                // if (id % 2 == 0 && id + 1 < data_->thrdNum) {
                //     while (data_->ready[id+1]) {
                //     }
                //     addInPlace(buf, data_->buffers[id+1]);
                // }
                ++data_->numDone;
            } // end while
        }
    };

    Data data_;
    std::vector<std::thread> thrds_;

public:
    // can only accept tasks equal to threadNum
    FixedSpinMulPool(int threadNum)
        : data_(threadNum)
    {
        for (int i = 0; i < threadNum; ++i) {
            thrds_.push_back(std::thread(Worker(&data_), i));
        }
    }

    ~FixedSpinMulPool()
    {
        data_.shouldExit = true;
        for (auto& r : data_.ready) {
            r = true;
        }
        for (auto& t : thrds_) {
            t.join();
        }
    }

    void addRange(std::size_t idx, std::size_t b, std::size_t e) {
        data_.ranges[idx].first = b;
        data_.ranges[idx].second = e;
    }
    
    void start(std::vector<uint32_t> const& lhs, std::vector<uint32_t> const& rhs,
               std::vector<uint32_t>& res)
    {
        data_.lhs = &lhs;
        data_.rhs = &rhs;
        data_.result = &res;
        data_.numDone = 0;
        for (auto& r : data_.ready) {
            r = true;
        }                       
        std::this_thread::yield();
    }

    void stop()
    {
    }

    bool done()
    {
        return data_.numDone == data_.thrdNum;
    }

    std::vector<std::vector<uint32_t>>& buffers() { return data_.buffers; }

    int thrdNum() { return data_.thrdNum; }
};

template <std::size_t B1, std::size_t B2>
BigUInt<B1+B2> fullMultiply_multithrd(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs, FixedMulPool& pool)
{
    BigUInt<B1+B2> result;
    int thrdNum = pool.thrdNum();
    std::size_t n = BigUInt<B2>::VLEN;
    const std::size_t workLoad = n / thrdNum;
    std::size_t rmd = n - workLoad * thrdNum;
    std::size_t j = 0;
    int i;
    for (i = 0; i < rmd; ++i) {
        auto p = j;
        j += workLoad + 1;
        pool.addRange(i, p, j);
    }
    for (; i < thrdNum; ++i) {
        auto p = j;
        j += workLoad;
        pool.addRange(i, p, j);
    }
    
    pool.start(lhs.data(), rhs.data(), result.data());
    {
        std::unique_lock<std::mutex> lck(pool.mutexDone());
        pool.cvDone().wait(lck, [&pool, thrdNum](){ return pool.numDone() == thrdNum; });
    }
    std::vector<std::vector<uint32_t>>& buffers = pool.buffers();
    for (auto& v : buffers) {
        addInPlace(result.data(), v);
    }
    // for (int i = 0; i < buffers.size(); i += 2) {
    //     addInPlace(result.data(), buffers[i]);
    // }
    pool.stop();

    return result;    
}

template <std::size_t B1, std::size_t B2>
BigUInt<B1+B2> fullMultiply_multithrd_spin(BigUInt<B1> const& lhs, BigUInt<B2> const& rhs, FixedSpinMulPool& pool)
{
    BigUInt<B1+B2> result;
    int thrdNum = pool.thrdNum();
    std::size_t n = BigUInt<B2>::VLEN;
    const std::size_t workLoad = n / thrdNum;
    std::size_t rmd = n - workLoad * thrdNum;
    std::size_t j = 0;
    int i;
    for (i = 0; i < rmd; ++i) {
        auto p = j;
        j += workLoad + 1;
        pool.addRange(i, p, j);
    }
    for (; i < thrdNum; ++i) {
        auto p = j;
        j += workLoad;
        pool.addRange(i, p, j);
    }
    
    pool.start(lhs.data(), rhs.data(), result.data());

    while (!pool.done()) {
        std::this_thread::yield();
    }

    std::vector<std::vector<uint32_t>>& buffers = pool.buffers();
    for (auto& v : buffers) {
        addInPlace(result.data(), v);
    }
    pool.stop();

    return result;    
}

#endif
