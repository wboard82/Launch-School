# Write a program that asks the user to enter an integer greater than 0, then 
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

num = ''

loop do
  puts "Please enter a number greater than 0."
  num = gets.chomp.to_i
  break if num > 0
  puts "Something went wrong. Try again."
end

loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product:"
  response = gets.chomp.downcase

  if response == 's'
    puts "The sum is #{(1..num).inject(&:+)}"
    break
  elsif response == 'p'
    puts "The product is #{(1..num).inject(&:*)}"
    break
  else
    puts "Something went wrong. Please enter 's' or 'p'."
  end
end
