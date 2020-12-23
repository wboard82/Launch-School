# returns true if all the alphabetic characters are uppercase
# false if any are lowercase
# ignore non-alphabetic characters
#
# essentially, return false if there are any lowercase characters

def uppercase?(string)
  string.chars.none? { |char| char.match?(/[a-z]/) }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
