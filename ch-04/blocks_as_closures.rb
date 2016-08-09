#When you define the block, it simply grabs the bindings that are there at that moment, and then 
#it carries those bindings along when you pass the block into a method:
#
#
def my_method
  x = "Goodbye"
  yield("cruel")
end

x = "Hello"

puts my_method{|y|"#{x}, #{y} world"}

# the variable x is not available to block
# You can also define additional bindings inside the block, but they disappear after the block ends:
# 

def just_yield
  yield
end

top_level_variable = 1

just_yield do 
  top_level_variable += 1
  local_to_block = 1
end

puts "The top level variable is: #{top_level_variable}"

puts "The local variable inside block is: #{local_to_block}" #will yield Error



#SCOPE
#
