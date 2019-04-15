#ifndef THREADSUPPORT_HPP
#define THREADSUPPORT_HPP

#include <atomic>
#include <vector>
#include <thread>
#include <mutex>
#include <functional>
#include <x86intrin.h>

class MulCtx_normal_multithrd
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
        // std::vector<std::mutex> lock;
        
        std::atomic_int numDone;
        bool shouldExit;

        Data(int tn)
            : thrdNum(tn), ranges(tn), buffers(tn),
              ready(tn), numDone(0), /*lock(tn),*/
              shouldExit(false) {
            for (auto& atm : ready) {
                std::atomic_init(&atm, false);
            }
        }
    };

    struct Worker
    {
        Data* data_;
        int id_;
        Worker(Data* d, int id)
            : data_(d), id_(id) {}

        void withoutSIMD()
        {
            
        }

        void operator()()
        {
            while (true) {
                while (!data_->ready[id_]) {
                    // std::this_thread::yield();
                }
                // std::lock_guard lck(data_->ready[id_]);
                
                if (data_->shouldExit)
                    return;                
                auto len = data_->lhs->size();
                auto plhs = data_->lhs;
                auto prhs = data_->rhs;
                auto beg = data_->ranges[id_].first;
                auto end = data_->ranges[id_].second;
                std::vector<uint32_t>& buf = data_->buffers[id_];                
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
                
                data_->ready[id_] = false;
                ++data_->numDone;
            } // end while
        }
    };

    Data data_;
    std::vector<std::thread> thrds_;

public:
    // can only accept tasks equal to threadNum
    MulCtx_normal_multithrd(int threadNum)
        : data_(threadNum)
    {
        // for (int i = 0; i < threadNum; ++i) {
        //     data_.ready[i].lock();
        // }
        for (int i = 0; i < threadNum; ++i) {
            thrds_.push_back(std::thread(Worker(&data_, i)));
        }        
    }

    ~MulCtx_normal_multithrd()
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
        // for (auto& lk : data_.ready) {
        //     lk.unlock();
        // }
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



class FixedSpinTaskPool
{
public:
    class TaskBase
    {
        // don't manage any memory
    public:
        virtual void operator()() = 0;
    };

private:
    struct Data
    {
        const int thrdNum;
        std::vector<std::atomic_bool> ready;
        std::vector<TaskBase*> tasks;
        std::atomic_int numDone;       
        bool shouldExit;

        Data(int tn)
            : thrdNum(tn),
              ready(tn), tasks(tn), numDone(0),
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
                (*data_->tasks[id])();
                
                ++data_->numDone;
                data_->ready[id] = false;    
            } // end while
        }
    };

    Data data_;
    std::vector<std::thread> thrds_;

public:    
    
    class TaskHandle
    {
    private:
        Data* pdata_;
        int workerId_;
    public:
        TaskHandle(Data* pdata, int id)
            : pdata_(pdata), workerId_(id) {            
        }

        bool done()
        {
            return pdata_->ready[workerId_] == false;
        }
    };
    
    FixedSpinTaskPool(int threadNum)
        : data_(threadNum)
    {
        for (int i = 0; i < threadNum; ++i) {
            thrds_.push_back(std::thread(Worker(&data_), i));
        }
    }

    ~FixedSpinTaskPool()
    {
        data_.shouldExit = true;
        for (auto& r : data_.ready) {
            r = true;
        }
        for (auto& t : thrds_) {
            t.join();
        }
    }

    void stop()
    {
        data_.numDone = 0;
    }

    TaskHandle emitTask(int id, TaskBase* f)
    {
        // start one
        TaskHandle ret(&data_, id);
        data_.tasks[id] = f;
        data_.ready[id] = true;
        return ret;
    }

    TaskHandle addTask(int id, TaskBase* f)
    {
        TaskHandle ret(&data_, id);
        data_.tasks[id] = f;
        return ret;
    }

    void startAll()
    {
        for (auto& r : data_.ready)
            r = true;
    }

    int numDone()
    {
        return data_.numDone;
    }

    int thrdNum()
    {
        return data_.thrdNum;
    }
};

#endif
