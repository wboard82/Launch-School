# Write a method that rotates an array by moving the first element to the end of
# the array. The original array should not be modified.

def rotate_array(arr)
  new_array = arr.drop(1)
  new_array << arr[0]
end

def rotate_array_given(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
puts  
p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true


def rotate_string(string)
  rotate_array(string.chars).join
end

p rotate_string("Hello") == "elloH"
p rotate_string("ABC") == "BCA"

def rotate_int(int)
  rotate_array(int.to_s.chars).join.to_i
end

p rotate_int(456) == 564
p rotate_int(12345) == 23451

