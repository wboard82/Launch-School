# Ask the user to type in their name and then print out a greeting with name 
# included.

print "Please enter your first name: "
first_name = gets.chomp
print "Please enter your last name: "
last_name = gets.chomp
puts "Hello, #{first_name} #{last_name}. It's nice to see you today."

10.times do |n|
  puts first_name + " " + last_name
end

