a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

# 7
# This is because another variable a is passed as an argument to the block.
# This shadows the a defined at the top level of the file and that one will
# not change.
