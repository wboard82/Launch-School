# This would be an error:
# puts "the value of 40 + 2 is " + (40 + 2)

# Two fixes:
puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
