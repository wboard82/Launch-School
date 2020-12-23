loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  break if answer == 4
  puts 'Incorrect, please try again.'
end
puts 'Correct!'
