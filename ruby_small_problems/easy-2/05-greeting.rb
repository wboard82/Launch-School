
puts "What is your name?"
name = gets.chomp

if name.end_with?('!')
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SHOUTING!?"
else
  puts "Hello #{name}."
end
