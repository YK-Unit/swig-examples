require 'mkmf'

# 声明追加的 CFLAGS，设置 ”-x c++“，告知 mkmf 使用 g++ 编译器代替 gcc
# 这样，have_header/find_header 才能识别 cpp 的头文件 
# 《Explicitly setting compiler to C++ in extconf.rb》：https://www.ruby-forum.com/t/explicitly-setting-compiler-to-c-in-extconf-rb/208668/10
$CFLAGS += " -x c++ "
puts "CFLAGS = #{$CFLAGS}"

# 声明追加的 CXXFLAGS
$CXXFLAGS += " -std=c++11 -Wno-error=reserved-user-defined-literal "
puts "CXXFLAGS = #{$CXXFLAGS}"

# 追加三方库的头文件查找路径
# add folder, where compiler can search source files
$VPATH << "$(srcdir)/cpp_hello_lib"
append_cppflags("-I$(srcdir)/cpp_hello_lib")
puts "VPATH = #{$VPATH}"
puts "CPPFLAGS = #{$CPPFLAGS}"
abort "missing header cpp_hello_lib.h" unless find_header("cpp_hello_lib.h")


# 声明源码文件（包括三方库）
$srcs = Dir.glob("#{$srcdir}/{,cpp_hello_lib/}*.{cxx,cpp}").map { |n| File.basename(n) }.sort
puts "srcs = #{$srcs}"

create_makefile('Example')