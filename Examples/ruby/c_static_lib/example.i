/* File : example.i */
%module example

%{
#include "c_hello_lib/include/c_hello_lib.h"
%}

/* Let's just grab the original header file here */
%include "c_hello_lib/include/c_hello_lib.h"
