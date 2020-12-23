# ALG:
# - given 'goal'
# - denominators = [] (holds result denominators)
# - current_sum = 0 (Rational?)
# - current_denom = 1
#
# LOOP:
#   - current_fraction = Rational(1, current_denom)
#   - If current_sum + current_fraction == goal
#     - add current_denom to denominators
#     - return denominators
#   - Elsif current_sum + current_fraction > goal
#     - increment current_denom
#   - Else
#     - current_sum += current_fraction
#     - denominators << current_denom
#     - increment current_denom

def egyptian(goal)
  denominators = []
  current_sum = 0
  current_denom = 1

  loop do
    current_frac = Rational(1, current_denom)

    if current_sum + current_frac == goal
      denominators << current_denom
      return denominators
    elsif current_sum + current_frac > goal
      current_denom += 1
    else
      current_sum += current_frac
      denominators << current_denom
      current_denom += 1
    end
  end
end



p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

def unegyptian(egyptian)
  egyptian.inject(0) { |sum, denom| sum + Rational(1, denom) }
end

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
