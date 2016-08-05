# When ruby can't find a method it calls a method named "method_missing" on the receiver. It is a private's instance
# method of BasicObject that every object inherits
# 
# we can call method_missing on a class using send
# 
class Doctor
end

rick = Doctor.new

# rick.send :method_missing, :my_method



# OVERRIDING METHOD_MISSING
# 
class Doctor
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(',')})"
    puts "(You also passed it a block)"  if block_given
  end
end


bob = Doctor.new

bob.talk_simple('a', 'b')

# GHOST METHODS
# From the caller’s side, a message that’s processed by method_missing looks like a regular call—but on the receiver’s side,
#  it has no corresponding method. This trick is called a Spell: Ghost Method.
#  
#  Hashie example
#  
require 'hashie'

icecream = Hashie::Mash.new

icecream.flavor = "strawberry"

icecream.flavor
