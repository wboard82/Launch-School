array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# I believe this will be an error, because a is defined within the block and
# will not be visible outside.
