#include "cpp_hello_lib.h"

#include <iostream>

namespace cpp_hello {
    void hello() {
        std::cout << "Hello, World!" << std::endl;
    }

    int add(int a, int b) {

        return a + b;
    }
}

