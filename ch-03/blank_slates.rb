# This problem crops up with Dynamic Proxies (Dynamic Proxy). When the name of a Ghost Method clashes 
# with the name of a real, inherited method, the latter wins. If you don’t need the inherited method,
#  you can fix the problem by removing it. While you’re at it, you might want to remove most methods 
#  from the class, preventing such name clashes from ever happening again. A skinny class with a 
#  minimal number of methods is called a Spell: Blank Slate. As it turns out, Ruby has a ready-made 
#  Blank Slate for you to use.
#  
#  
#  BASICOBJECT
# The root of Ruby’s class hierarchy, BasicObject, has only a handful of instance methods:

im = BasicObject.instance_methods

puts im

# f you don’t specify a superclass, your classes inherit by default from Object, which is itself a subclass of
# BasicObject. If you want a Blank Slate (Blank Slate), you can inherit directly from BasicObject instead.
# For example, if Computer inherited directly from BasicObject, then it wouldn’t have a problematic display method.
# 
#  Inheriting from BasicObject is the quicker way to define a Blank Slate in Ruby. In some cases, however, you might 
#  want to control exactly which methods to keep and which methods to remove from your class. Let’s see how you can
#  remove a specific method from a class.
#  
#  
#  REMOVING METHODS
# You can remove a method from a class by using either Module#undef_method or Module#remove_method. 
# The drastic undef_method removes any method, including the inherited ones. The kinder remove_method removes 
# the method from the receiver, but it leaves inherited methods alone. Let’s look at a real-life library that 
# uses undef_method to create a Blank Slate.