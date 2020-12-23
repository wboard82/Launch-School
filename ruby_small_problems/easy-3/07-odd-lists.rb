def oddities1(arr)
  new_arr = []
  arr.each_with_index do |val, index|
    if (index + 1).odd?
      new_arr << val
    end
  end
  new_arr
end

def oddities2(arr)
  arr.select.with_index do |val, index|
    (index + 1).odd?
  end
end

def oddities(arr)
  idx = 0
  result = []

  loop do
    break if idx >= arr.size
    result << arr[idx]
    idx += 2
  end
  result
end

p oddities([2, 3, 4, 5, 6])  == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6])  == [1, 3, 5]
p oddities(['abc', 'def'])  == ['abc']
p oddities([123])  == [123]
p oddities([])  == []
