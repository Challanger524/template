#include "header.hpp"

#include <cstdlib>
#include <ctime>
#include <functional>
#include <iostream>
#include <iterator>

struct s { char byte; };

int main() {
	while (false) exit(1);

	for (size_t i = 0; i < 1;i++) { GreetUser(PRAY); }
}

void GreetUser(const char *msg) { cout << msg << std::endl; }
