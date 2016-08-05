# When you call a method, Ruby does two things: 
# 1.It finds the method, a process called method lookup.  
# 2. It executes the method.To do that, Ruby needs something called self.

# The receiver is the object that you call a method on.        
# Ex, if you write my_string.reverse(), then my_string is the receiver.

# When a method is called, Ruby goes in the receiver’s class, and from there it climbs the ancestors chain until 
# it finds the method

class MyClass
	def my_method
		'my_method()'
	end
end

class MySubclass < MyClass
end
obj = MySubclass.new

puts obj.my_method

# If the method is not found in MyClass, Ruby would look for the method by climbing up the chain into Object and finally
# BasicObject.


# the ancestors chain also includes modules. When you include a module in a class (or even in another module),
# Ruby inserts the module in the ancestors chain, right above the including class itself:

module M1
	def my_method
		'my_method()'
	end
end

class C
	include M1
end

class D < C
end

puts D.ancestors

#You can use prepend method which works like include, but inserts the module in a class's chain of ancestors
# using the prepend method.

class C2
	prepend M1
end

class D2 < C2
end

puts "The ancesor chain using prepend method: "
puts D2.ancestors


# Ruby includes some methods, such as print, that you can call from anywhere in your code. It looks like each and every object
# has the print method. Methods such as print are actually private instance methods of module Kernel:

Kernel.private_instance_methods.grep(/^pr/)

# It is because class Object includes Kernel, so Kernel gets into every object’s ancestors chain.
# Every line of Ruby is always executed inside an object, so you can call the instance methods in Kernel from anywhere which
# gives you the illusion that print is a language keyword, when it’s actually a method.

# You can add a method to Kernel and it will be available to all object’s

# METHOD EXECUTION


def my_method
	temp = @s + 1
	my_other_method(temp)
end

# To execute tje method above, Ruby needs to answer two questions.1.what object does the instance variable @x belong to? 
# 2.what object should you call my_other_method on? Ruby doesn’t have the luxury of intuition.When you call a method, 
# it needs to tuck away a reference to the receiver. this reference can remember who the receiver is as it executes the method.


# Every line of Ruby code is executed inside an object—the so-called current object.
# The current object is also known as self, because you can access it with the self keyword.
# Only one object can take the role of self at a given time, but no object holds that role for a long time.
# In particular, when you call a method, the receiver becomes self.From that moment on, all instance variables are instance 
# variables of self, and all methods called without an explicit receiver are called on self. As soon as your
# code explicitly calls a method on some other object, that other object becomes self.

class MyClass2

	def testing_self
		@var = 10
		my_method()
		self
	end


	def my_method
		@var = @var + 1
	end

end

obj2 = MyClass2.new

p obj2.testing_self


# PRIVATE METHOD

# you cannot call a private method with an explicit receiver. it must be on the implicit receiver—self

class E
	def public_method
		puts "This is a public method."
		private_method 
	end

	private 

	def private_method 
		puts "This is a private method"
	end
end

e1 = E.new 

p e1.public_method


p e1.private_method # private method `private_method' called for #<E:0x00000001a220c8> (NoMethodError)



# Refinements are similar to Monkeypatches, but they’re not global.  A Refinement is active in only two places: the
# refine block itself and the code starting from the place where you call using until the end of the module 
# (if you’re in a module definition) or the end of the file (if you’re at the top level)
# 
# Refinements are like pieces of code patched right over a class, and they override normal method lookup. On the other 
# hand, a Refinement works in a limited area of the program: the lines of code between the call to using and the end of 
# the file, or the end of the module definition.
