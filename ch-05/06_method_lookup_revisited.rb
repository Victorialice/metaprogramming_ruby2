class C
	def a_method
		'C#a_method()'
	end
end

class D < C
end


obj = D.new

p obj.a_method

p obj.singleton_class

class<<obj
	def a_singleton_method
		'obj # a_singleton_method()'
	end
end

p obj.a_singleton_method
p obj.singleton_class


# If an object has a singleton class, Ruby starts looking for methods in the singleton class rather than the conventional class, 
# and that’s why you can call Singleton Methods such as obj#a_singleton_method.
# If Ruby can’t find the method in the singleton class, then it goes up the ancestors chain, ending in the superclass of the 
# singleton class—which is the object’s class. From there, everything is business as usual.