# Return all the divisors of the positive integer argument.

# def divisors(num)
#   divisors = []
#   counter = 1

#   while counter <= num / 2
#     divisors << counter if num % counter == 0
#     counter += 1
#   end

#   divisors << num unless num == 1
#   divisors
# end

# def divisors(num)
#   prime_factors = prime_factors(num)

#   factors = [1]

#   1.upto(prime_factors.size) do |comb_size|
#     prime_factors.combination(comb_size) do |combination|
#       factors << combination.inject(&:*)
#     end
#   end

#   factors.uniq
# end

# def prime_factors(num)
#   return [] if num == 1
#   return [2].concat(prime_factors(num / 2)) if num.even?

#   counter = 3
#   while counter <= num
#     if num % counter == 0
#       return [counter].concat(prime_factors(num / counter))
#     end
#     counter += 2
#   end
# end

require 'prime'

def divisors(num)
  prime_factors = num.prime_division.flat_map do |num, exp|
    [num] * exp
  end

  factors = [1]

  1.upto(prime_factors.size) do |comb_size|
    prime_factors.combination(comb_size) do |combination|
      factors << combination.inject(&:*)
    end
  end

  factors.uniq
end

# p prime_factors(1) == []
# p prime_factors(2) == [2]
# p prime_factors(5) == [5]
# p prime_factors(6) == [2, 3]
# p prime_factors(12) == [2, 2, 3]
# p prime_factors(98) == [2, 7, 7]

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
