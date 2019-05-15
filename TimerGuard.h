#ifndef TIMERGUARD_H__
#define TIMERGUARD_H__
#include <iostream>
#include <chrono>

class TimerGuard
{
public:
    struct Delay {};
    TimerGuard(std::string d, std::ostream& os = std::cout)
	: start_(std::chrono::system_clock::now()),
	  description_(std::move(d)), os_(os), stopped_(false), sum_(0.0) {}
    TimerGuard(std::string d, Delay, std::ostream& os = std::cout)
	: description_(std::move(d)), os_(os), stopped_(true), sum_(0.0) {}
    
    ~TimerGuard() {
	if (!stopped_)
	    stop();
        os_ << description_ << " " << sum_ << std::endl;
    }
    
    void stop() {
	auto end = std::chrono::system_clock::now();
	std::chrono::duration<double> du = end - start_;
        sum_ += du.count();
	stopped_ = true;
    }

    void resume() {
        // assume stopped_ == true
        stopped_ = false;
        start_ = std::chrono::system_clock::now();
    }

    double sum() const {
        return sum_;
    }
private:
    std::chrono::high_resolution_clock::time_point start_;
    std::string description_;
    std::ostream& os_;
    bool stopped_;
    double sum_;
};

#endif
