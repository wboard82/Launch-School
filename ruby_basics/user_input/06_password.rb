
# Write a program that displays a welcome message, but only after the user enters
# the correct password, where the password is a string that is defined as a constant 
# in your program. Keep asking for the password until the user enters the correct password.

PASSWORD = "L@unch5ch00l"

loop do
  puts "Please enter the password: "
  input = gets.chomp
  break if input == PASSWORD
  puts "Incorrect password. Please try again."
end
puts "Welcome to Launch School Ruby Basics Exercises!"
