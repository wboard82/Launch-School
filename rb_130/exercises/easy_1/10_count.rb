# def count(arr)
#   counter = 0
#   arr.each { |elem| counter += 1 if yield(elem) }
#   counter
# end

def count(arr)
  counter = 0
  0.upto(arr.size - 1) { |idx| counter += 1 if yield(arr[idx]) }
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
