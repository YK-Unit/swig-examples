require 'mkmf'

# 声明追加的 CFLAGS，设置 ”-x c++“，告知 mkmf 使用 g++ 编译器代替 gcc
# 这样，have_header/find_header 才能识别 cpp 的头文件 
# 《Explicitly setting compiler to C++ in extconf.rb》：https://www.ruby-forum.com/t/explicitly-setting-compiler-to-c-in-extconf-rb/208668/10
$CFLAGS += " -x c++ "
puts "CFLAGS = #{$CFLAGS}"

# 声明追加的 CXXFLAGS
$CXXFLAGS += " -std=c++11 -Wno-error=reserved-user-defined-literal "
puts "CXXFLAGS = #{$CXXFLAGS}"

# $LDFLAGS += " -x c++ "
# puts "LDFLAGS = #{$LDFLAGS}"

# 声明引入三方库
dir_config('cpp_hello_lib', "$(srcdir)/cpp_hello_lib")
# 导入库的三方库的头文件
# have_header or find_header 都可以
abort "missing header cpp_hello_lib.h" unless have_header("cpp_hello_lib.h")
# abort "missing header cpp_hello_lib.h" unless find_header("cpp_hello_lib.h")
# abort "missing header cpp_hello_lib.h" unless find_header("cpp_hello_lib.h", "$(srcdir)/cpp_hello_lib")

# link三方库
abort "missing static library cpp_hello_lib" unless have_library("cpp_hello_lib")
# find_library 查找 cpp 库中的方法总是提升失败，但是查找 c 库中的方法却可以——这个可看 c_static_lib 示例
# abort "missing method in cpp_hello_lib static library" unless find_library("cpp_hello_lib", "hello", "$(srcdir)/cpp_hello_lib")


# 声明源码文件
$srcs = ["example_wrap.cxx"]
puts "srcs = #{$srcs}"

create_makefile('Example')