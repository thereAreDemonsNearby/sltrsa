#ifndef TIMERGUARD_H__
#define TIMERGUARD_H__
#include <cstdio>
#include <chrono>

class TimerGuard
{
public:
    TimerGuard(std::string d)
	: start_(std::chrono::system_clock::now()),
	  description_(d) {}
    ~TimerGuard() {
	auto end = std::chrono::system_clock::now();
	std::chrono::duration<double> du = end - start_;
	std::printf("%s %f\n", description_.c_str(), du.count());
    }
private:
    std::chrono::system_clock::time_point start_;
    std::string description_;
};

#endif
