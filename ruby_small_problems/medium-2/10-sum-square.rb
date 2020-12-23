# Write a method that computes the difference between the square of the sum of 
# the first n positive integers and the sum of the squares of the first n positive integers.
#
# PROBLEM:
# - Two sums:
#   - (1 + 2 + ... + n)**2
#   - (1**2 + 2**2 + ... + n**2)
# - Difference between them (sq of sums - sum of sqs)
# - First n positive integers (0 not a valid input?)
# - 1 -> 0    (1 ** 2) - (1) ** 2 = 0
# 
# DATA: integers
#
# ALG:
# - 'sum_to_be_sqaured' and 'sum_of_squares'
# - Begin with 1
# - Count up to n
# - On each count (iteration) ('num' will count up)
#   - sum_to_be_squared += 'num'
#   - sum_of_squares += 'num' ** 2
# - (sum_to_be_squared ** 2) - sum_of_squares

def sum_square_difference(n)
  sum_to_be_squared = 0
  sum_of_squares = 0

  1.upto(n) do |num|
    sum_to_be_squared += num
    sum_of_squares += num ** 2
  end

  sum_to_be_squared ** 2 - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

