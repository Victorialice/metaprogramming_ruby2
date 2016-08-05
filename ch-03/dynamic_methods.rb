class MyClass
  def my_method(arg)
    arg * 2
  end
end

obj = MyClass.new

puts obj.my_method(4)

# An alternate way of using dot notation to call a method by using send
# 
puts obj.send(:my_method, 5)

# The first argument to send can be a symbol or a string representing the name of a method. 
# Any remaining arguments (and the block, if one exists) are simply passed on to the method.
# 
# The use send instead of the plain old dot notation used because with send, the name of the method that you want to call becomes just a regular argument.
# You can wait literally until the very last moment to decide which method to call, while the code is running.This technique is called Spell: Dynamic Dispatch
# 
# Symbols are immutable: you can change the characters inside a string, so you can use a symbol when you refer to a method name.
# 
# 
puts 1.send(:+, 2)


# PRY EXAMPLE
# 
# A Pry object stores the interpreter’s configuration into its own attributes, such as memory_size and quiet:
# 
# require "pry"
#
# pry = Pry.new
#
# puts "Pry memory size is: #{pry.memory_size}"
#
# puts "Pry quiet is: #{pry.quiet}"


# The Object#send method is very powerful—perhaps too powerful. In particular, you can call any method with send, including private methods.
# 
# 
# 
# DEFINING METHODS DYNAMICALLY
# You can define a method on the spot with Module#define_method. You just need to provide a method name and a block, which becomes the method body:

class Dynamic
  define_method :my_dynamic_method do |x|
    x * 3
  end
end

dyn = Dynamic.new

x = dyn.my_dynamic_method(4)

puts "The dynamic method value: #{x}"