# Prompts the user for 2 positive integers.
# Then prints the results of addition, subtraction, product, quotient,
# remainder, and power using those two numbers.

numbers = []
puts "Please enter the first number:"
numbers << gets.to_i
puts "Please enter the second number:"
numbers << gets.to_i

ops = %i(+ - * / % **)

if numbers[1] == 0
  ops = ops - %i(/ %)
  puts
  puts "Not performing division or modulo because second number is 0."
end


ops.each do |op|
  puts "#{numbers[0]} #{op.to_s} #{numbers[1]} = #{numbers.reduce(&op)}"
end

