require 'mkmf'

# 声明追加的 CFLAGS
$CFLAGS += " -std=c11 -Wno-error=reserved-user-defined-literal "
puts "CFLAGS = #{$CFLAGS}"

# 追加三方库的头文件查找路径
# add folder, where compiler can search source files
$VPATH << "$(srcdir)/c_hello_lib"
append_cppflags("-I$(srcdir)/c_hello_lib")
puts "VPATH = #{$VPATH}"
puts "CPPFLAGS = #{$CPPFLAGS}"
abort "missing header c_hello_lib.h" unless find_header("c_hello_lib.h")

# 声明源码文件（包括三方库）
$srcs = Dir.glob("#{$srcdir}/{,c_hello_lib/}*.c").map { |n| File.basename(n) }.sort
puts "srcs = #{$srcs}"

create_makefile('Example')