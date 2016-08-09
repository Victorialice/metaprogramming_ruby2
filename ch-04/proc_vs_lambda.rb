# Procs created with lambda are called lambdas, while the others are simply called procs.
# There are two differences between procs and lambdas. One has to do with the return keyword,
# and the other concerns the checking of arguments.
# 
# 
def double(callable_object)
  callable_object.call * 2
end

# In a lambda, return just returns from the lambda:
l = lambda {return 10}

p double(l)

# In a proc, return behaves differently. Rather than return from the proc, it returns from the
#  scope where the proc itself was defined:
#  
def another_double
  p = Proc.new { return 10}
  result = p.call
  return result * 2
end

p another_double


x = Proc.new {|a, b| [a, b]}

p x.arity 

# lambdas tend to be less tolerant than procs (and regular blocks) when it comes to arguments.
# Call a lambda with the wrong arity, and it fails with an ArgumentError. On the other hand,
#  a proc fits the argument list to its own expectations: