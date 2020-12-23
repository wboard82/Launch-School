# map is called on the outer array of a nested array
# it will return a transformed array based on the return value of each block execution
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  # select is called on each inner array
  # select will include elements in its return value (a new inner array)
  # if the block execution returns true
  arr.select do |item|
    # call to to_s on item (an inner-array element), then to_i on that return value
    # will return an integer
    # == operator called on this return value with original item as a parameter
    # return value is Boolean - true if they are equal, false otherwise
    # this return value is passed to conditional (if)
    # if evaluates the return value
    # for true it takes the true branch
    # otherwise it takes the false
    #  - both of these return a boolean
    #  - for true branch, the item is an integer and the whole block returns true if that integer is > 13
    #  - for the false branch, the item is a string and the whole block returns true if that string is longer than 6
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]
