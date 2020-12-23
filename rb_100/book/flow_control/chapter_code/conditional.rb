print "Please enter a number: "
num = gets.chomp.to_i

if num == 3 then puts "The number is 3."
elsif num == 4 then puts "The number is 4."
else puts "The number is not 3 or 4."
end

print "Please enter another number: "
num = gets.chomp.to_i

puts "The number is 7." if num == 7
puts "The number is not 7 or 8." unless num == 8 || num == 7
puts "The number is 8." if num == 8
