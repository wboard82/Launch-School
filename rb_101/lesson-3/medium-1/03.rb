def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1: The purpose of number % divisor == 0 is to check whether the number
# is divisible by the current divisor. If so, the divisor, and number/divisor
# are both factors.
#
# Bonus 2: The purpose of factor in the last line is to return the factors array.a
