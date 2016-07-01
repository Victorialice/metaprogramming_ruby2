# Ruby constructs such as class, module and instant variables etc live together in a system called the object model.
# The object model is where you’ll find answers to questions such as “Which class does this method come from?” and 
# “What happens when I include this module?”

# In a sense, the class keyword in Ruby is more like a scope operator than a class declaration

​class​ D​   ​
	def​ x
	 ​'x'​
	end​​ ​
end​​ ​ ​

# In the second time Ruby reopens the class and define the method
class​ D​   ​
	def​ y
	 ​'y'​
	end​​ ​
end​​ ​ 

obj = D.new

p obj.x
p obj.y

#  you can always reopen existing classes—even standard library classes such as String or Array—and modify them on the fly called this technique as: Open Class.

# However opening and modifying a class that is already defined in Ruby always is not good idea as it can
# create or inadvertantly introduce more bugs into code. k/a Monkeypatching

# To find out if any method exists in Array class
p [].methods.grep /^re/

# adding a new method is usually safer than modifying an existing one.