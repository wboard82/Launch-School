# Implement your own reduce method

def reduce(arr, acc = nil)
  if acc.nil?
    idx = 1
    acc = arr[0]
  else
    idx = 0
  end

  while idx < arr.size
    acc = yield acc, arr[idx]
    idx += 1
  end

  acc
end

def reduce2(arr, acc = arr[0])
  idx = (acc == arr[0] ? 1 : 0)

  while idx < arr.size
    acc = yield acc, arr[idx]
    idx += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

