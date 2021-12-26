/* File : example.i */
%module example

%{
#include "../src/example.h"
%}

/* Let's just grab the original header file here */
%include "../src/example.h"
