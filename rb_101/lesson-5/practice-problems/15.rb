# Return an array that contains only the hashes where all integers are even

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

only_even = arr.select do |hsh|
  hsh.values.flatten.all? {|n| n.even? }
end

p only_even
