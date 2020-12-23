# Write a method that takes two sorted Arrays as arguments, and returns a new 
# Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. 
# You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

=begin
PROBLEM:
INPUT: 'arr1' and 'arr2' both are sorted
OUTPUT: array with all elements of 'arr1' and 'arr2' in sorted order

- do not sort the result array
- build result one element at a time in proper order
- do not mutate (use pointers instead of shifting elements)
- either array can be empty (doesn't matter)
- repeated elements are okay

ALGORITHM:
- given 'arr1' and 'arr2'
- set 'ptr1' and 'ptr2' = 0
- set result_arr = []

- LOOP:
  - break if either ptr is >= it's array's size
  - compare the element pointed to by ptr1 to ptr2
  - if ptr1's element is smaller (arr1[ptr1] < arr2[ptr2]):
    - push that element of arr1 onto result_arr
    - increment ptr1
  - else
    - push arr2's element onto result_arr
    - increment ptr2

- if ptr1 >= arr1.size
  - push the rest of the elements from arr2 on result_arr (each)
- else
  - push the rest of the elements from arr1 on result_arr (each)

- return result_arr
=end

def my_merge(arr1, arr2)
  ptr1 = 0
  ptr2 = 0
  result_arr = []

  loop do
    break if ptr1 >= arr1.size || ptr2 >= arr2.size
    if arr1[ptr1] < arr2[ptr2]
      result_arr << arr1[ptr1]
      ptr1 += 1
    else
      result_arr << arr2[ptr2]
      ptr2 += 1
    end
  end

  if ptr1 >= arr1.size
    ptr2.upto(arr2.size - 1) do |idx|
      result_arr << arr2[idx]
    end
  else
    ptr1.upto(arr1.size - 1) do |idx|
      result_arr << arr1[idx]
    end
  end

  result_arr
end

def merge(arr1, arr2)
  result = []
  idx2 = 0

  arr1.each do |elem|
    while idx2 < arr2.size && arr2[idx2] < elem
      result << arr2[idx2]
      idx2 += 1
    end
    result << elem
  end

  result.concat(arr2[(idx2..-1)])
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
