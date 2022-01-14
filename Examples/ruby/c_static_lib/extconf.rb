require 'mkmf'

# 声明追加的 CFLAGS
$CFLAGS += " -std=c11 -Wno-error=reserved-user-defined-literal "
puts "CFLAGS = #{$CFLAGS}"

# 声明引入三方库
dir_config('c_hello_lib', "$(srcdir)/c_hello_lib")
abort "missing header c_hello_lib.h" unless find_header("c_hello_lib.h", "$(srcdir)/c_hello_lib")
abort "missing method in c_hello_lib static library" unless find_library("c_hello_lib", "hello", "$(srcdir)/c_hello_lib")

# 声明源码文件
$srcs = ["example_wrap.c"]
puts "srcs = #{$srcs}"

create_makefile('Example')