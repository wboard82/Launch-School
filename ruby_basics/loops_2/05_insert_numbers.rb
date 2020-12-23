numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  
  numbers.push(input)

  if numbers.length == 5
    puts "Thank you. Here's what you entered:"
    break
  end
end
puts numbers
