
print "Enter a number: "
x = gets.chomp.to_i
y = x

while x >= 0
  puts x
  x -= 1
end

puts "Done! Now trying until..."

until y < 0
  puts y
  y -= 1
end

puts "Done!"
