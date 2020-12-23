def rotate_array(arr)
  new_array = arr.drop(1)
  new_array << arr[0]
end

# Create a string out of the number, then split chars into an array
# Split the array into two (front, back) at -n
# Add front with rotate_array(back)
# Join to string and convert to int

def my_rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  front = digits.first(digits.size - n)
  back = digits.last(n)
  (front + rotate_array(back)).join.to_i
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
