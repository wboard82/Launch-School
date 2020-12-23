USER_NAME = "admin"
PASSWORD = "L@unch5ch00l"
user_try = nil

loop do
  puts "Please enter your user name:"
  user_try = gets.chomp
  puts "Please enter the password: "
  pass_try = gets.chomp
  break if pass_try == PASSWORD && user_try == USER_NAME
  puts "Ivalid username or password. Please try again."
end
puts "Welcome, #{user_try}!"
