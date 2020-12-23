loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts "Okay, I'll keep looping. Enter 'yes' to stop."
end
