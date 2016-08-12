# The Ruby interpreter assumes that all instance variables belong to the current object self. Also true in a class definition:

# In a class definition, the role of self belongs to the class itself, so the instance variable @my_var belongs to the class.
# Not to confused. Instance variables of the class are different from instance variables of that class’s objects,


class MyClass
	@my_var = 1

	def self.read
		@my_var
	end

	def write
		@my_var = 2
	end

	def read
		@my_var
	end
end

obj = MyClass.new

x = obj.read

p "The read method on instance of the class obj: #{x}"

y = obj.write

p "The write method on instance of the class obj: #{y}"

z = obj.read

p "The read method on instance of the class obj after write: #{z}"

p "Class method applied on class itself #{MyClass.read}"

#  Class Instance Variable can be accessed only by the class itself—not by an instance or by a subclass.