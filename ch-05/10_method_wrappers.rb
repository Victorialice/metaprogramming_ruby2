# When you have a method that you don’t want to modify directly because it’s in a library, and if you want to wrap additional functionality around 
# this method so that all clients get the additional functionality automatically. You can do this in a few ways, 

#1. By Module#alias_method

class MyClass
	def my_method
		'my_method()'
	end

	alias_method :m, :my_method
end

obj = MyClass.new

p obj.my_method

p obj.m