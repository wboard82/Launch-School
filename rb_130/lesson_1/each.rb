# Implement your own each method

def each(arr)
  index = 0

  while index < arr.length
    yield arr[index]
    index += 1
  end

  arr
end

arr1 = ['a', 'b', 'c']

p each(arr1) { |elem| puts elem }
puts "--------"

p each(arr1) { |elem| puts elem.upcase! }
