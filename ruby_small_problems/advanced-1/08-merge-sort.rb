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

=begin
PROBLEM: sort an array by breaking it down into smaller and smaller arrays, then putting back together in sorted order

[5, 3] -> [5], [3] (merge) -> [3, 5]
[6, 2, 7, 1, 4] -> [6, 2], [7, 1, 4] -> [6], [2], [7], [1, 4] - > [6], [2], [7], [1], [4]

ALGORITHM:
- given an array, 'arr'
- if 'arr' is size 1, return arr
- otherwise:
  - middle = arr.size / 2
  - merge the result of calling merge_sort on two halves of the 'arr' 
    arr[(0..middle)], arr[(middle+1..-1)]
=end

require 'pry'

def merge_sort(arr)
  return arr if arr.size <= 1

  middle = arr.size / 2

  merge(merge_sort(arr[0...middle]), merge_sort(arr[middle..-1]))
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

#study Try making a non-recursive merge sort
