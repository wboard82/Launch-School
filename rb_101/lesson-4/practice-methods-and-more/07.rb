[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# What is the block's return value? How is it determined?
# The block returns true or false depending on the return value of #odd?
# Since that is the last expression in the block, it determines the return value.
#
# What does #any? return?
# This returns true since the block returns true for an element.
#
# What does it output?
# => 1
# Because it outputs 1 and then the block returns true. After that it doesn't keep
# running.
