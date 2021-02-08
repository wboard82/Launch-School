def step(start, stop, step)
  return nil if stop < start

  while start <= stop
    yield start
    start += step
  end

  start - step
end

def step(start, stop, step)
  return nil if stop < start

  loop do
    yield start
    break if start + step > stop
    start += step
  end

  start
end

step(1, 10, 3) { |value| puts "value = #{value}" }
arr = []
step(3, 12, 3) { |value| arr << value }
p arr == [3, 6, 9, 12]
arr = []
step(2, 10, 5) { |value| arr << value }
p arr == [2, 7]
