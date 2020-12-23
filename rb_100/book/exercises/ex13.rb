# Use Ruby's Array method delete_if And string method start_with? to delete all the words
# in the array that start with "s"

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|word| word.start_with?("s")}
p arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

# original solution:
# arr.delete_if {|word| word.start_with?("s") || word.start_with?("w")}
# better solution:
arr.delete_if {|word| word.start_with?("s", "w")}
p arr
