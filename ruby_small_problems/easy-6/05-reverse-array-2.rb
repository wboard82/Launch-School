def reverse1(array)
  new_array = []
  index = -1

  while index >= (-array.size)
    new_array << array[index]
    index -= 1
  end
  new_array
end

def reverse(array)
  array.inject([]) {|new_arr, elem| new_arr.unshift(elem)}
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
 
p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
