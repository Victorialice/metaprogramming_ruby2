# At the top level of your program, the current class is Object, the class of main.
# (That’s why, if you define a method at the top level, that method becomes an instance 
	#method of Object).

# When you open a class with the class keyword (or a module with the module keyword), that class becomes the current class.

# In a method, the current class is the class of the current object. (Try defining a method 
# inside another method with def, and you’ll see that the new method is defined on the class of self.	
# This information is probably going to win you some Ruby trivia contest.)