


module MyModule
	def my_method
		"Hello"
	end
end

obj = Obj.new


class<<obj
	include MyModule
end

class MyClass
	extend MyModule
end

p MyClass.my_method