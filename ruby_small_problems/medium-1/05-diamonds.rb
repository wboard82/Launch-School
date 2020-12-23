# Write a method that displays a 4-pointed diamond in an n x n grid, where n
# is an odd integer that is supplied as an argument to the method.
# assume that the argument will always be an odd integer.
#
# Input: Odd Integer
# Output: Print a diamond in an n x n grid
#
#  - Number of lines = n
#  - Width of middle line = n
#  - Position of first * is (n / 2) + 1
#  - Number of spaces before the first * = n/2
#  - Number of stars always begins with 1, increases by 2 until n
#
# Examples:
# diamond(1)
#
# *
#
# diamond(3)
#
#  *
# ***
#  *
#
# diamond(5)
#
#   *
#  ***
# *****
#  ***
#   *

def diamond(n)
  spaces = n/2
  stars = 1

  loop do
    puts " " * spaces + "*" * stars
    break if stars == n
    spaces -= 1
    stars += 2
  end

  loop do
    spaces += 1
    stars -= 2
    break if stars <= 0
    puts " " * spaces + "*" * stars
  end
end

#study do outline diamond

diamond(1)
puts
diamond(3)
puts
diamond(9)
