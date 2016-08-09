# As soon as you walk through scope gate, local variables fall out of scope. 
# So, how can you carry my_var across not one but two Scope Gates?
# 
# define instance methods in the class if you pass a block to Class.new:
my_var = "Success"

MyClass = Class.new do 
  "#{my_var} in the class definition"

  define_method :my_method do 
    "#{my_method} inside the method."
  end
end

obj = MyClass.new
obj.my_method