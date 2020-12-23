# Create a method that takes two numbers and multiplies them

def multiply(x, y)
  x * y
end

def square(x)
  multiply(x, x)
end

# Raises x to the nth power
def to_the_n(x, n)
  ans = 1
  n.times { ans = multiply(ans, x) }
  ans
end

puts square(5) == 25 
puts square(-8) == 64
puts to_the_n(5, 2) == 25
puts to_the_n(5, 3) == 125
