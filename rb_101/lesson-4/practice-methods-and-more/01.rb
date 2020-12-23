[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# return value?
# [1, 2, 3]
# This returns the original array because 'hi' is the return value of the block and it is truthy.
# Since there is a truthy return value, the select method puts each value into the array.

