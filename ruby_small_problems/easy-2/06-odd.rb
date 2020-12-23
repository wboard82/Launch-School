# print all odd number from 1 to 99, inclusive
# print each number on new line

(1..99).each do |n|
  puts n if n.odd?
end

puts "-------------------"

num = 1
while num <= 99 do
  puts num
  num += 2
end

puts "-------------------"

arr = (1..99).to_a
puts arr.select { |n| n.odd? }

puts "-------------------"

1.upto(99) { |n| puts n if n.odd? }
