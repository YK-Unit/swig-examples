# file: runme.rb

# This file illustrates the C++ interface created by SWIG.
# All of our C++ classes get converted into Ruby classes.

require './example'

puts "Example-Module-Methods: #{Example::methods}"
puts ""

# ----- Object creation -----

class RbCallback < Example::Callback   # Inherit from a C++ class
   def initialize
      puts "Creating RbCallback~"
      super()
   end

   def run
      puts "RbCallback.run()"
   end

   def print_log_message(file, line)
      puts "[ruby-example] [flr] [#{file}:#{line}]"
   end 
end

puts "RbCallback-Methods: #{RbCallback::methods}"
puts ""


puts "Create an Caller instance\n"
caller = Example::Caller.new
puts "caller-inst-Methods: #{caller::methods}"
puts ""

# Add a simple C++ callback (caller owns the callback, so
# we disown it first by clearing the .thisown flag).

puts "Adding and calling a normal C++ callback"
puts "----------------------------------------"

callback = Example::Callback.new
caller.setCallback(callback)
caller.call()

puts ""
puts "Adding and calling a Ruby callback"
puts "------------------------------------"

callback = RbCallback.new
caller.setCallback(callback)
caller.call()

puts ""
puts "Create an Caller2 instance"
caller2 = Example::Caller2.new
puts "caller2-inst-Methods: #{caller2::methods}"
puts ""

# Add a simple C++ callback (caller owns the callback, so
# we disown it first by clearing the .thisown flag).

puts "Adding and calling a normal C++ callback"
puts "----------------------------------------"

callback = Example::Callback.new
caller2.setCallback(callback)
caller2.call()

puts ""
puts "Adding and calling a Ruby callback"
puts "------------------------------------"

callback = RbCallback.new
caller2.setCallback(callback)
caller2.call()

puts ""
puts "Goodbye\n"
