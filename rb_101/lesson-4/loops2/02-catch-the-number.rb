loop do
  number = rand(100)
  puts number
  break if number.between?(0,10)
end

puts "Caught a number between 0 and 10!"
