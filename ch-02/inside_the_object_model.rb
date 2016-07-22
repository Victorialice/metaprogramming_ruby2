class MyClass
	def my_method
		@v = 1
	end
end

obj = MyClass.new
p obj.class


# You can peek at any instance variables of an object by:

p obj.my_method

p obj.instance_variables

# Unlike in Java or other static languages, in Ruby there is no connection between an object’s class and its instance variables.
# Instance variables just spring into existence when you assign them a value, so you can have objects of the same class that carry 
# different instance variables.


# Methods  			  			  			  			  			  			
# Objects also have methods and uou can get a list of an object’s methods by calling Object#methods.Most objects (including obj in
# the previous example) inherit a number of methods from Object, so this list of methods is usually quite long.  			 
# You can use Array#grep to check that my_method is in obj’s list:  

p obj.methods.grep(/my/)


# Objects that share the same class also share the same methods, so the methods must be stored in the class, not the object.”

# Because a class is an object, everything that applies to objects also applies to classes.        
# Classes, like any object, have their own class, called—you guessed it—Class

#  the methods of a class are the instance methods of Class:

p Class.instance_methods(false)

# You can rightly say that “obj has a method called my_method,” meaning that you’re able to call obj.my_method(). By contrast, you 
# shouldn’t say that “MyClass has a method named my_method.” That would be confusing, because it would imply that you’re able to 
# call MyClass.my_method() as if it were a class method.


# An object’s instance variables live in the object itself, and an object’s methods live in the object’s class. That’s why objects
# of the same class share methods but don’t share instance variables.

# A Ruby class inherits from its superclass.

p Array.superclass
p Object.superclass
p BasicObject.superclass

puts "The superclass of Class is: #{Class.superclass}"

# The superclass of Class is Module—which is to say, every class is also a module.	To be precise, a class is a module with three additional 
# instance methods (new, allocate, and superclass) that allow you to create objects or arrange classes into hierarchies.

