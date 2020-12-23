numbers = []

loop do
  break if numbers.size == 5
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
end
puts numbers
