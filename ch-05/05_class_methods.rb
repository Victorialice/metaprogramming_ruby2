# calling a method on a class is the same as calling a method on an object:
# 1. an_object.a_method
# 2. AClass.a_class_method
# 
#  The first line calls a method on an object referenced by a variable, and the second line calls
#   a method on an object (that also happens to be a class) referenced by a constant.
#   
#   Syntax for singleton method
#   
#   def object.method
#     method body
#   end