# Write a method that counts down to 0 using recursion

def recursive_countdown(n)
  if n < 0
    puts "Can't countdown from a negative number!"
  elsif n == 0
    puts 0
  else
    puts n
    recursive_countdown(n-1)
  end
end

recursive_countdown(5)
puts ""
recursive_countdown(10)
puts ""
recursive_countdown(-1)
puts ""
recursive_countdown(0)
