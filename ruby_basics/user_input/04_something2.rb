# My solution
loop do
  puts "Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase 

  if answer == 'y'
    puts "something"
    break
  elsif answer == 'n'
    break
  else
    puts "Invalid input - please enter 'y' or 'n'!"
  end
end

#study: given solution (below)

puts "------------------------"
puts "Here's another solution"
puts "------------------------"
choice = nil

loop do
  puts "Do you want me to print something? (y/n)"
  choice = gets.chomp.downcase
  break if %w(y n).include?(choice)
  puts "Invalid input - please enter y or n!"
end

puts "something" if choice == 'y'
