#ifndef TIMERGUARD_H__
#define TIMERGUARD_H__
#include <iostream>
#include <chrono>

class TimerGuard
{
public:
    TimerGuard(std::string d, std::ostream& os = std::cout)
	: start_(std::chrono::system_clock::now()),
	  description_(std::move(d)), os_(os), stopped_(false) {}
    ~TimerGuard() {
	if (!stopped_)
	    stop();
    }

    void reset() {
	stopped_ = false;
	start_ = std::chrono::system_clock::now();
    }

    void reset(std::string d) {
	stopped_ = false;
	start_ = std::chrono::system_clock::now();
	description_ = std::move(d);
    }
    
    void stop() {
	auto end = std::chrono::system_clock::now();
	std::chrono::duration<double> du = end - start_;	
	os_ << description_ << ' ' << du.count() << std::endl;
	stopped_ = true;
    }
private:
    std::chrono::system_clock::time_point start_;
    std::string description_;
    std::ostream& os_;
    bool stopped_;
};

#endif
