# file: runme.rb

# This file illustrates the C++ interface created by SWIG.
# All of our C++ classes get converted into Ruby classes.

require './example'

puts "Example-Methods: #{Example::methods}"

Example::hello
puts "Example::add(1,2): #{Example::add(1, 2)}"

puts "Goodbye"
