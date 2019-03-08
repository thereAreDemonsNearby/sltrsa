#ifndef TIMERGUARD_H__
#define TIMERGUARD_H__
#include <iostream>
#include <chrono>

class TimerGuard
{
public:
    TimerGuard(std::string d, std::ostream& os = std::cout)
	: start_(std::chrono::system_clock::now()),
	  description_(d), os_(os) {}
    ~TimerGuard() {
	auto end = std::chrono::system_clock::now();
	std::chrono::duration<double> du = end - start_;	
	os_ << description_ << ' ' << du.count() << std::endl;
    }
private:
    std::chrono::system_clock::time_point start_;
    std::string description_;
    std::ostream& os_;
};

#endif
