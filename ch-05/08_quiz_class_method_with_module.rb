# How do you define a class method inside a module?

# Ans: first, define my_method as a regular instance method of MyModule.  Then include the module in the singleton class of MyClass.
module MyModule
	def my_method
		"Hello"
	end
end


class MyClass
	class << self
		include MyModule
	end
end

