def event(description)
  puts "ALERT: #{description}" if yield 
end

load "events.rb"
load "events2.rb"