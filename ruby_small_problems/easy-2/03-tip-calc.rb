

puts "What is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
tip_percentage = gets.to_f

tip = bill * tip_percentage / 100.0
tip.round(2)

puts format("The tip is $%.2f", tip)
puts format("The total is $%.2f", tip + bill)

