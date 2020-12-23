puts "Exercise 1: Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value."

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each do |n|
  puts n
end

puts "-------------------"
puts "Exercise 2: Same as above but only print values greater than 5:"

arr.each do |n|
  if n > 5
    puts n
  end
end

puts "-------------------"
puts "Exercise 3: Use the select method to extract all odd values into a new array:"

arr_odd = arr.select {|n| n % 2 == 1}
p arr_odd

puts "-------------------"
puts "Exercise 4: Append 11 to the end of the original array. Prepend 0 to the beginning."

arr.push(11)
arr.unshift(0)
p arr

puts "-------------------"
puts "Get rid of 11 and append 3."

arr.pop
arr.push(3)
p arr

puts "-------------------"
puts "Get rid of duplicates without specifically removing any one value."

arr.uniq!
p arr

puts "-------------------"
