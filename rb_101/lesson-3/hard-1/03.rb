#A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"     # => "one"
puts "two is: #{two}"     # => "two"
puts "three is: #{three}" # => "three"

# Here the local variables within the method are reassigned and so do not change
# the value of the ones that it was called with.

puts "-----------------------------"

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"     # => "one"
puts "two is: #{two}"     # => "two"
puts "three is: #{three}" # => "three"
# Same explanation here. Even though the reassignment is to a literal, it still
# changes only the local method variable.

puts "-----------------------------"

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# Here the object is mutated within the method. So the object that the variable
# is pointing to is changed from within the method and remains changed outside.
