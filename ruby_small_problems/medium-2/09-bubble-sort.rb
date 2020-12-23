=begin
Bubble Sort is one of the simplest sorting algorithms available. It isn't an
efficient algorithm, but it's a great exercise for student developers. In this 
exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. 
On each pass, each pair of consecutive elements is compared. If the first of the
two elements is greater than the second, then the two elements are swapped.
This process is repeated until a complete pass is made without performing any 
swaps; at that point, the Array is completely sorted.

INPUT: array (of sortable elements)
OUTPUT: same array (with elements in ascending sorted order)

NOTES:
 - Will have at least two elements
 - Sorting should happen in place
 - Make multiple passes through the array.
 - Compare consecutive elements
 - If the first element is greater than the second, swap them
 - If we make it all the way through with no swaps, the sort is done

 Data: Array

 ALG:
 - Given array: 'arr'
 - LOOP
   - SET 'swap_made' to false
   - SET 'idx' to 0
   - LOOP until idx >= arr.size - 2
     - IF arr[idx] > arr[idx + 1]
       - swap arr[idx] and arr[idx+1]
       - SET swap_made = true
     - ELSE do nothing
     - idx += 1
   - Break unless swap_made 
=end

def bubble_sort!(arr)
  n = arr.size
  loop do
    new_n = 0

    1.upto(n - 1) do |idx|
      if arr[idx] < arr[idx - 1]
        p "Swapping #{arr[idx]} and #{arr[idx-1]}"
        arr[idx], arr[idx - 1] = arr[idx - 1], arr[idx]
        new_n = idx
      end
    end
    n = new_n

    break if n >= 1
  end

  arr
end

array = [5, 3]
bubble_sort!(array)
p array #== [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array #== [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
