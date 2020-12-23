# Look at Ruby's merge method. Notice that it has two versions. What is the 
# difference between merge and merge!? Write a program that uses both and 
# illustrate the differences.

h1 = {foo: 4, bar: 8}
h2 = {bar: 9, baz: 18}
h3 = {bam: 16, foo: 32}

puts "h1: #{h1}"
puts "h2: #{h2}"
puts "h3: #{h3}"
puts "h1.merge(h2): #{h1.merge(h2)}"
puts "h1.merge(h2, h3): #{h1.merge(h2, h3)}"
puts "h1: #{h1}"
puts "h2: #{h2}"
puts "h3: #{h3}"
puts "h1.merge!(h2, h3): #{h1.merge!(h2, h3)}"
puts "h1: #{h1}"

