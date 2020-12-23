# What method could you use to find out if a Hash contains a specific value in it?
# Write a program to demonstrate this use.

h = {name: "Josh", birthday: "4/15/82", sign: "Aries", age: 38}

puts "has_value?('Josh') #{h.has_value?('Josh')}"
puts "h.has_value?('Joshua') #{h.has_value?('Joshua')}"
