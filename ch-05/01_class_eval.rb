# How can you open the class if you don’t know its name?You need some way other than the class keyword to change the current 
# class? By the class_eval method.
# Module#class_eval (also known by its alternate name, module_eval) evaluates a block in the context of an existing class:

def add_method_to(a_class)
	a_class.class_eval do 
		def m
			"Hello"
		end
	end
end

add_method_to(String)

p "This is a sample string".m

# By changing the current class, class_eval effectively reopens the class, just like the class keyword does.

# you use instance_eval to open an object that is not a class, and class_eval to open a class definition and define methods with def.