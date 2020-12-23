# Use the each_with_index method to iterate through an array of your creation 
# that prints each index and value of the array.

arr = ["Zero", "One", "Two", "Three", "Four", "Five"]

arr.each_with_index {|v, i| puts "#{i}: #{v}"}
