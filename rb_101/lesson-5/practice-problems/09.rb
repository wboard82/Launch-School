# Return a new array, but with the subarrays ordered in descending order
# (alphabetically or numerically as appropriate.)

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted = arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end

p sorted
