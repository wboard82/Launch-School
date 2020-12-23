# My original solution
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"

  if iterations >= 5
    break
  end

  iterations += 1
end
puts "-----------------"
# Given solution
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"

  iterations += 1
  
  break if iterations > 5
end
