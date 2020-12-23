def sum_of_sums1(arr)
  result = 0
  multiplier = arr.size
  arr.each do |n|
    result += n * multiplier
    multiplier -= 1
  end
  result
end

def sum_of_sums(arr)
  result = 0
  counter = 0
  loop do
    break if counter >= arr.size
    result += arr[0..counter].inject(&:+)
    counter += 1
  end
  result
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
