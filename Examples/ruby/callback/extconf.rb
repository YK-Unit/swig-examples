require 'mkmf'
$CXXFLAGS += " -std=c++11 -Wno-error=reserved-user-defined-literal "
create_makefile('Example')