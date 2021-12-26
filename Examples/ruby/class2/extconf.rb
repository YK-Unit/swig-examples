require 'mkmf'
$CXXFLAGS += " -std=c++11 -Wno-error=reserved-user-defined-literal "

# stackoverflow: mkmf ignores files in sub-folders when it compiles the C extension
# https://stackoverflow.com/a/35842162/1505549
$srcs = ["example_wrap.cxx", "src/example.cxx"]

# add include path to the internal folder
# $(srcdir) is a root folder, where "extconf.rb" is stored
$INCFLAGS << " -I$(srcdir)/src"

# add folder, where compiler can search source files
$VPATH << "$(srcdir)/src"

create_makefile('Example')