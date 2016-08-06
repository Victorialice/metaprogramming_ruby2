def a_method(a,b)
	a + yield(a,b)
end

x = a_method(1,2){|x, y|(x + y) * 3}

puts "The value of a_method block returns: #{x}"

# You can define a block only when you call a method. The block is passed straight into the method, 
# and the method can call back to the block with the yield keyword.

# like a method, a block returns the result of the last line of code it evaluates.

def b_method
	return yield if block_given?
	'No block given'
end


puts b_method

puts b_method{"Here is a block given!"}