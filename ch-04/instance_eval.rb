class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do 
 p self  #<MyClass:0x007f84e404e898 @v=1>
 p @v  # 1
end

# The block is evaluated with the receiver as self, so it can access the receiver’s private methods and instance variables, such as @v. 
# Even if instance_eval changes self, the block that you pass to instance_eval can still see the bindings from the place where it’s 
# defined, like any other block:
# 

v = 2

x = obj.instance_eval { @v = v}
p x

y = obj.instance_eval { @v}

p y

# Using instance_eval you can break into an object to peek inside it.
# Sometimes you create an object just to evaluate blocks inside it. An object like that can be called a Spell: Clean Room:
# 
# 
class CleanRoom
  def current_temp
  end
end

clean_room = CleanRoom.new 

clean_room.instance_eval do
  if current_temp < 20
    puts "wear jacket"
  end
end