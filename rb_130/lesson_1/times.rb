# Implement your own times method

def times(num)
  counter = 0

  while counter < num
    yield counter
    counter += 1
  end

  num
end

puts times(5) { |num| puts num }

