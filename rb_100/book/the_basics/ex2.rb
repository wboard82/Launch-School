# Use the modulo operator, division, or a combination of both to take a 4 digit
# number and find the digit in the: 
# 1) thousands place 
# 2) hundreds place 
# 3) tens place 
# 4) ones place

a = 1234
b = 9876

puts "a = #{a}:"
puts "ones: #{a % 10}"
puts "tens: #{(a / 10) % 10}"
puts "hundreds: #{(a/100) % 10}"
puts "thousands: #{(a/1000) % 10}"

puts "b = #{b}:"
puts "ones: #{b % 10}"
puts "tens: #{(b / 10) % 10}"
puts "hundreds: #{(b/100) % 10}"
puts "thousands: #{(b/1000) % 10}"
