lines = nil

loop do
  puts ">> How many output lines do you want? Enter a number >= 3:"
  lines = gets.chomp.to_i
  break if lines >= 3
  puts "That's not enough lines!"
end

lines.times do
  puts "Launch School is the best!"
end

