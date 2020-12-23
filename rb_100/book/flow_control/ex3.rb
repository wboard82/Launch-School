# Write a program that takes a number from the user between 0 and 100 and reports
# back whether the number is between 0 and 50, 51 and 100, or above 100.

print "Please enter a positive number: "
num = gets.chomp.to_i

case
when num > 0 && num <= 50
  puts "The number is between 0 and 50."
when num > 50 && num <= 100
  puts "The number is between 51 and 100."
when num <= 0
  puts "You did not enter a positive number."
else
  puts "The number is greater than 100."
end

