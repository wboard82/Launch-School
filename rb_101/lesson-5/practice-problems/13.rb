# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically by only taking into consideration
# the odd numbers they contain.

# Array (of arrays) -> NEW Array (of arrays)
# - Sub-arrays are sorted, but only considering odd numbers


arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted = arr.sort do |arr1, arr2|
  arr1.select { |el| el.odd? } <=> arr2.select { |el| el.odd? }
end

p arr
p sorted
