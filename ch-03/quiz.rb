# class Roulette
#   def method_missing(name, *args)
#     person = name.to_s.capitalize
#     3.times do 
#       number = rand(10) +1
#       puts "The random number is: #{number}"
#     end

#     "#{person} got a #{number}"
#   end
# end


# number_of = Roulette.new

# puts number_of.bob

# puts number_of.frank

# puts number_of.charlie

# The above Roulette contains a bug that causes an infinite loop. It prints a long list of numbers and finally crashes.The variable number is defined 
# within a block (the block that gets passed to times) and falls out of scope by the last line of method_missing. When Ruby executes that line, 
# it can’t know that the number there is supposed to be a variable. As a default, it assumes that number must be a parentheses-less method call 
# on self.In normal circumstances, you would get an explicit NoMethodError that makes the problem obvious. But in this case you have a method_missing,
# and that’s where the call to number ends. The same chain of events happens again—and again and again—until the call stack overflows.

class Roulette2
  def method_missing(name, *args)
    person = name.to_s.capitalize
    number = rand(10) +1
    3.times do
      number2 = rand(10) + 1    
      puts "The random number is: #{number2}"
    end

    "#{person} got a #{number}"
  end
end

number_of = Roulette2.new

puts number_of.bob

puts number_of.frank

puts number_of.charlie


# Better way
# 
class Roulette3
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless %w[Bob Frank Bill].include? person
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

number_of3 = Roulette3.new
puts number_of3.bob
puts number_of3.frank
puts number_of3.bill