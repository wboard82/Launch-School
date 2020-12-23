def xor?(a, b)
  !!(a && !b || b && !a)
end

# Truthy vs. Boolean return?
# && and || return a value from the expression rather than true or false
# && returns the first value if it is falsy, otherwise, it returns the second
# value
# || returns the first value if it is true, otherwise it returns the second
# value
#
# 5 && 6 => 6
# 5 || 6 => 5
# 5 || nil => 5
# 5 && nil => nil
# 5 && false => false

# `a && b` is equivalent to:
# if a then b else a
#
# 'a || b` is equivalent to:
# if a then a else b

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
