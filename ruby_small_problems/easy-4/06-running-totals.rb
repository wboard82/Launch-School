def my_running_total(arr)
  running_sum = 0
  running_totals = []

  arr.each do |num|
    running_sum += num
    running_totals << running_sum
  end
  
  running_totals
end

def running_total1(arr)
  sum = 0
  arr.map { |n| sum += n }
end


def running_total(arr)
  sum = 0
  arr.each_with_object([]) { |elem, result_arr| result_arr << sum += elem }
end

def running_total(arr)
  sum = 0
  arr.inject([]) do |result, elem|
    result << sum += elem
    result
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
