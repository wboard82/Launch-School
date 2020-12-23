[1, 2, 3].reject do |num|
  puts num
end

# Return value of reject?
# [1, 2, 3]
# Reject returns a new array of all the values from the original where the block
# is falsey. Since puts returns nil, the block is always false and we get a copy
# of the original array.
