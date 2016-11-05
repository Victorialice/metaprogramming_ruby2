
# Ruby allows you to add a method to a single object
# 
str = "Just a regular string"

def str.title?
  self.upcase == self
end


p str.title?

p str.methods.grep(/title?/)

p str.singleton_methods

# The previous code adds a method named title? to str.  No other object gets the method—not even other Strings.        A method like this one, which is specific to a single object, is called a Spell: Singleton Method.

# class methods are Singleton Methods of a class. The definition of a Singleton Method and the definition of a class method, 
# you’ll see that they’re the same:

