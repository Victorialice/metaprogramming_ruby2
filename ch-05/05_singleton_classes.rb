# Class methods are a special kind of Singleton Method
# Ruby provides a way to define methods that are specific to a particular object and such methods are known as Singleton Methods. 
# When one declares a singleton method on an object, Ruby automatically creates a class to hold just the singleton methods. 
# The newly created class is called Singleton Class.

# When you ask an object for its class, Ruby doesn’t always tell you the whole truth.Instead of the class that you see, 
# an object can have its own special, hidden class. That’s called the singleton class of the object.


# Methods like Object#class keep the singleton class carefully hidden, but you can work around them. Ruby has a special
#  syntax, based on the class keyword, that places you in the scope of the singleton class:

# class Test << an_object
# 	# code here
# end


# obj = Object.new

# singleton_class = class << obj
# 	self
# end

# 	p singleton_class.class

p "ABC".singleton_class