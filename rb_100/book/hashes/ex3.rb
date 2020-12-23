# Using some of Ruby's built-in Hash methods, write a program that loops through
# a hash and prints all of the keys. Then write a program that does the same thing 
# except printing the values. Finally, write a program that prints both.

h = {name: "Josh", birthday: "4/15/82", sign: "Aries", age: 38}

puts "Keys:"
h.keys.each do |k|
  puts k
end

puts "Values:"
h.values.each do |v|
  puts v
end


h.each do |k, v|
  puts "#{k}: #{v}"
end
