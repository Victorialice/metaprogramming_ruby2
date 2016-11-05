# From Ruby 2.1 if you ask a singleton class for its ancestors, the result will include ancestors that are themselves singleton classes

class C
	def a_method
		'C#a_method()'
	end
	# Add a class method to the program
	class << self
		def a_class_method
			"C.a_class_method()"
		end
	end
end

class D < C
end


obj = D.new


p obj.class

p C.singleton_class

p D.singleton_class

p D.singleton_class.superclass

p C.singleton_class.superclass

# There are 3 different ways to define a class method

def MyClass.a_class_method
end

class MyClass
	def self.another_class_method
	end

	class <<self
		def yet_another_class_method
		end
	end
end

