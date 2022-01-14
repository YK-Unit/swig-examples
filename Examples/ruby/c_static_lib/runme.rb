# file: runme.rb

# This file illustrates the C++ interface created by SWIG.
# All of our C++ classes get converted into Ruby classes.

require './example'

puts "Example-Methods: #{Example::methods}"

puts "invoke Example:hello methods now: "

Example::hello

puts "Goodbye"
