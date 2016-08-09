# This example shows how scope changes as your program runs, tracking the names of bindings with the Kernel#local_variables method:
# 
v1 = 1

class MyClass # Scope gate; entering class
  v2 = 2
  puts "step A: #{local_variables}" # ["v2"]
  def my_method                     # Scope gate: entering method
    v3 = 3
    puts "step B: #{local_variables}"
  end                                  # Scope gate: leaving method
  puts "step C: #{local_variables}"
end                                    # Scope gate: leaving class                                 
  
obj = MyClass.new

x = obj.my_method
puts "Calling my method first time #{x}"

puts "The local variables: #{local_variables}"

y = obj.my_method

puts "Calling my method second time #{y}"

puts "The local variables: #{local_variables}"

# in Ruby, where scopes are sharply separated: as soon as you enter a new scope, the previous bindings are replaced by a new set of 
# bindings. This means that when the program enters MyClass, v1 “falls out of scope” and is no longer visible.


# Global variables can be accessed by any scope
# 
def a_scope
  $var = "some value"
end

def another_scope
  $var
end

scope = a_scope
puts "A scope is: #{scope}"

scope2 = another_scope

puts "Another scope value is: #{scope2}"

# The problem with global variables is that every part of the system can change them, so in no time
#  you’ll find it difficult to track who is changing what. For this reason, the general rule is this: 
#  when it comes to global variables, use them sparingly, if ever.
#  
#  
#  SCOPE GATES
# There are exactly three places where a program leaves the previous scope behind and opens a new one:

# 1. Class definitions 2. Module definitions 3. Methods
# Scope changes whenever the program enters (or exits) a class or module definition or a method. These 
# three borders are marked by the keywords class, module, and def, respectively. Each of these keywords
# acts like a Spell: Scope Gate. See above
# 
# The code in a class or module definition is executed immediately. Conversely, the code in a method 
# definition is executed later, when you eventually call the method
# 
# 



