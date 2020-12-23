=begin
PROBLEM:
- Combine two arrays passed as arguments
- Return a NEW array
- That combines all elements in both arrays
- Elements alternate: a1 b1 a2 b2, etc
- Assume they are the same length and non-empty

EXAMPLES:
- see below

DATA:
- arrays

ALGORITHM:
- Initialize 'combined_arr' = []
- For each element in 'arr1':
  - Add element to 'combined_arr'
  - Use its index to add corresponding element from 'arr2' to 'combined_arr'
- Return 'combined_arr'
=end

def interleave1(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave2(arr1, arr2)
  combined_arr = []
  arr1.each_with_index do |elem, index|
    combined_arr << elem
    combined_arr << arr2[index]
  end
  combined_arr
end

def interleave(arr1, arr2)
  arr1.each_with_object([]).with_index do |(elem, combined_arr), index|
    combined_arr << elem << arr2[index]
  end
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
