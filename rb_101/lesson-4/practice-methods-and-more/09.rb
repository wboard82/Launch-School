{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# What is the return value of map?
# [nil, 'bear']
#
# Map returns an array the same size as the original with each new element the 
# value of the block run on the element at the corresponding position.
# Since 'ant' is not longer than 3 the if statement will produce nil
# 'bear' is the longer than 3 and so it gets returned from the block and added
# to the array.
