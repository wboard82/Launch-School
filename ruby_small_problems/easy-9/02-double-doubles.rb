# if 'num' is double a double number, return 'num'
# else return 2 * num
#
# double_number?
# - convert num into a string
# - calculate beginning of 2nd half (length / 2)
# - check if first half and second half are equal
#   - first half: [0..middle - 1], second half: [middle..-1]
# - return this value

def twice(num)
  if double_number?(num)
    num
  else
    num * 2
  end
end


def double_number?(num)
  return false if num < 10
  string = num.to_s
  half_length = string.length / 2
  string[0..half_length - 1] == string[half_length..-1]
end

p twice(37)     == 74
p twice(44)     == 44
p twice(334433) == 668866
p twice(444)    == 888
p twice(107)    == 214
p twice(103103) == 103103
p twice(3333)   == 3333
p twice(7676)   == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5)      == 10
