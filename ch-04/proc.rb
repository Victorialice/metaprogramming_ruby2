# Blocks are not objects in Ruby. So when you want to store a block and execute it later
# to do that, you need an object.
# 
# Ruby provides standard library class Proc
# 
# A Proc is a block that has been turned into an object. You can create a Proc by passing the block to Proc.new.

# Later, you can evaluate the block-turned-object with Proc#call:
# 
increment = Proc.new{ |x| x + 1}

p increment.call(2)

# The other ways to create a proc is using Ruby Kernel Methods, creating Proc with lambda
# 
# 
decrement = lambda {|x| x - 1}

p decrement.class

p decrement.call(5)


# 
# 
# 
# Another way to create lambda k/a stabby lambda
# 
x = ->(x){ x + 1}


# creating proc using & operator
# 
# A block is like an additional anonymus argument to a method and in most cases it is executed right there
# in the method using "yield" But in few cases yield is not enough
# 1. When you want to pass the block to another method or even another block
# You want to convert blcok to Proc
# 
# 
# 
# In both cases, you need to point at the block and say, “I want to use this block”—to do that, you need a name.
# To attach a binding to the block, you can add one special argument to the method. This argument must be the 
# last in the list of arguments and prefixed by an & sign. Below is a method that passes the block to another method:
# 
# 

def math(a,b)
  yield(a,b)
end

def do_math(a,b, &operation)
  math(a,b, &operation)
end

p do_math(2,3){|x, y| x * y}

# If you call do_math without a block, the &operation argument is bound to nil, and the yield operation in math fails.

# p do_math(3,5) will give proc.rb:48:in `math': no block given (yield) (LocalJumpError)
# 
#  & means : “I want to take the block that is passed to this method and turn it into a Proc.”
#  
def my_method(&ex_proc)
  p ex_proc
end

x = my_method{|name|"Hello, #{name}"}

p x.class

p x.call("Bill")

# What if you want to convert proc back to block? You can use the same & operator to convert the Proc to a block:
# 
# 
def greet_method(greeting)
  "#{greeting}, #{yield}"
end

p my_proc = proc {"Bill"}

p greet_method("Hello", &my_proc)