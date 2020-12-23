def my_reverse!(array)
  index = 0
  while index < (array.size / 2)
    array[index], array[(-index) - 1] = array[(-index) - 1], array[index]
    index += 1
  end
  array
end

def reverse!(array)
  l_index = 0
  r_index = -1

  while l_index < (array.size / 2)
    array[l_index], array[r_index] = array[r_index], array[l_index]
    l_index += 1
    r_index -= 1
  end
  array
end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
 
p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]
 
p list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]
 
p list = []
p reverse!(list) == []
p list == []
