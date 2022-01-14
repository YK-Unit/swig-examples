/* File : example.i */
%module example

%{
#include "cpp_hello_lib/cpp_hello_lib.h"
%}

/* Let's just grab the original header file here */
%include "cpp_hello_lib/cpp_hello_lib.h"
