def drop_while(arr)
  result = []

  arr.each_with_index do |elem, index|
    if yield(elem) == false
      result = arr[index..-1]
      break
    end
  end

  result
end

def drop_while(arr)
  index = arr.index { |elem| yield(elem) == false }
  index.nil? ? [] : arr[index..-1]
end

# LS Solution:
def drop_while(arr)
  index = 0
  while index < arr.size && yield(arr[index])
    index += 1
  end

  arr[index..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
