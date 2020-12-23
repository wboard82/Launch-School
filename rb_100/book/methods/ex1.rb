# Write a program that prints a greeting message. This program should contain a
# method called greeting that takes a name as its parameter and returns a string.

def greeting(name)
  puts "Well howdy there, #{name}."
end

print "Please enter your name: "
name = gets.chomp
greeting(name)
