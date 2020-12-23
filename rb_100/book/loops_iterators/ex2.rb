# Write a loop that takes some input from the user, performs an action and only
# stops when the user inputs "STOP"


loop do
  print "Please enter a word (STOP to stop): "
  input = gets.chomp
  puts "You entered: #{input}"
  if input == "STOP"
    break
  end
end

