# Class definitions also return the value of the last statement, just like methods and blocks do:
#  wherever you are in a Ruby program, you always have a current object: self. Likewise, you always have 
#  a current class (or module). When you define a method, that method becomes an instance method of the current class.
#  
#  At the top level of your program, the current class is Object, the class of main
#  
#  When you open a class with the class keyword (or a module with the module keyword), that class becomes the current class.          
#  
#  How can you open the class if you don’t know its name? One need some way other than the class 
#  keyword to change the current class. By class_eval method.
#  
#  Module#class_eval (also known by its alternate name, module_eval) evaluates a block in the context of an existing class:
#  
def add_method_to(a_class)
  a_class.class_eval do 
    def m
      "Hello!"
    end
  end
end


add_method_to(String)

p "abc".m

# By changing the current class, class_eval effectively reopens the class, just like the class keyword does.
# Class_eval can be used on any variable that references the class
# When we use or open a class using keyword class it opens a new scope thus losing sight of the current bindings
# while class_eval has a Flat Scope
# 
# just like instance_eval has a twin method called instance_exec, module_eval/class_eval also has an equivalent
# module_exec/class_exec method that can pass extra parameters to the block.
# 
# 
# The Ruby interpreter always keeps a reference to the current class (or module). All methods defined with 
# def become instance methods of the current class. In a class definition, the current object self and the current
#  class are the same—the class being defined. If you have a reference to the class, you can open the class with 
#  class_eval (or module_eval)