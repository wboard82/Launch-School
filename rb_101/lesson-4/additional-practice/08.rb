numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# Output would be 1, 3 because:
# 1 is printed
# Then 1 is dropped from the array (#shift)
# 2, 3, 4 are moved up
# So 3 is the second element
# Then 2 is dropped and 3 and 4 are moved up
# And there is no 3rd element for the array to return

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# Output is 1, 2 for similar reasons, but the elements don't move
