def zip(arr1, arr2)
  idx = 0
  result = []

  while idx < arr1.size
    result << [arr1[idx], arr2[idx]]
    idx += 1
  end

  result
end

def zip(arr1, arr2)
  arr1.map.with_index { |item, index| [item, arr2[index]] }
end

def zip(arr1, arr2)
  result = []

  (0...arr1.size).each do |idx|
    result << [arr1[idx], arr2[idx]]
  end

  result
end

def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, arr2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
