def rotate_array(arr)
  new_array = arr.drop(1)
  new_array << arr[0]
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  front = digits.first(digits.size - n)
  back = digits.last(n)
  (front + rotate_array(back)).join.to_i
end

# Integer -> Integer
# Begin by rotating the number to the left (first digit becomes last)
# Then fix that first digit in place and rotate the remaining digits.
# Then fix the next digit and repeat the process until there is only one digit
# left, which becomes the last digit of the new number.
#
# Data - Array, and convert number to string, string to array
#
# Algorithm - 
#   - define a function: max_rotate_array
#   - max_rotation:
#     - convert number to array of chars
#     - pass array of chars to max_rotate_array
#     - join the return value and convert to integer
#   - max_rotate_array
#     - if the size of the array is 1, return the array
#     - else temp_array = rotate_array(array)
#     - return [temp_array[0]] + max_rotate_array[1..-1]
#                   
def max_rotate_array(array)
  return array if array.size == 1
  temp_array = rotate_array(array)
  [temp_array[0]] + max_rotate_array(temp_array[1..-1])
end

def max_rotation(number)
  array = number.to_s.chars
  max_rotate_array(array).join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(123) == 213
p max_rotation(1234) == 2431
p max_rotation(12345) == 24153
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(8001) == 108

#study - Try solution with rotate_rightmost_digits
#study - try solution without previous functions
