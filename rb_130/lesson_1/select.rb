# Define your own select method

def select(arr)
  result = []
  idx = 0

  while idx < arr.size
    result << arr[idx] if yield arr[idx]
    idx += 1
  end

  result
end

arr = [1, 2, 3, 4, 5]
p select(arr) { |elem| elem.odd? }
puts "============"
p select(arr) { |elem| elem < 4 }

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
