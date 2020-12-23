# array of integers -> integer
# Takes an array of integers and returns the average
#  - array will not be empty
#  - numbers will be positive
#  - use integer division

def average(arr)
  arr.reduce(:+) / arr.size
end


puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

def average_f(arr)
  arr.reduce(:+) / arr.size.to_f
end


puts average_f([1,6]) == 3.5
puts average_f([1, 5, 4]) == 10 / 3.0

