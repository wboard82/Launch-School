def missing(arr)
  all = [*(arr.first..arr.last)]
  all - arr
end

def missing(arr)
  missing = []

  arr.each_cons(2) do |first, second|
    missing.concat([*(first+1)...second])
  end

  missing
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
