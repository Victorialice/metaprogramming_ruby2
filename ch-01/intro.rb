# Metaprogramming is writing code that writes code

# Introspection in action

class Greeting
  def initialize(text)
    @text = text
  end
  
  def welcome
    @text
  end
end

new_object = Greeting.new("Helo")

# Objects and classes are first-class citizens in Ruby, and you can get a lot of information by asking them
p new_object.class

p new_object.class.instance_methods(false)     # => [:welcome]
p new_object.instance_variables  



# What if you want to add new instance methods to Greeting, alongside welcome, while the program is running? 