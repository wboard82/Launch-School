[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end


# Return value of map? Why?
# [1, nil, nil] and it outputs: => 2 3
# 1 is not greater than 1 so the return value of the block is 1 and that ends
# up in the array. The other numbers are greater than 1 so they are output.
# In those cases, the return value is nil, so that is the value put in the result array.

