# print all even numbers from 1 to 99, inclusive
# print each number on new line

(1..99).each do |n|
  puts n if n.even?
end

puts "-------------------"

num = 2
while num <= 99 do
  puts num
  num += 2
end

puts "-------------------"

arr = (1..99).to_a
puts arr.select { |n| n.even? }

puts "-------------------"

1.upto(99) { |n| puts n if n.even? }
