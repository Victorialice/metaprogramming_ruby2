# constants begin with an uppercase letter. Ex can be names of classes or modules
# They are very similar to a variable except for the fact that the scope of the constant follows its own
# special rules. You can change the value of a constant 

# module MyModule
# 	MyConstant = "Outer Constant"

# 	class MyClass
# 	  MyConstant = "Inner constant"
# 	end
# end

# All the constants in a program are arranged in a tree similar to a file system, where modules (and classes) are 
# directories and regular constants are files. Like in a file system, you can have multiple files with the same name, 
# as long as they live in different directories. You can even refer to a constant by its path, as you’d do with a file.

module M
  class C 
  	X = "a constant"
  	module M2
  		puts Module.nesting
  	end
  end

  Y = "A constant in M"

  C::X 
end

#  constants are nested like directories and files.        Also like directories and files, constants are uniquely
#  identified by their  paths.Constants’ paths use a double colon as a separator.

puts "A constant: #{M::C::X}"

puts "All the constants: #{M.constants}"
puts "Module nesting: #{M::C::M2}"
puts "Module nesting: #{Module.nesting}"

