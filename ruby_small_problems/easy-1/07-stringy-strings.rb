# positive integer -> string
# produces a string of '1' followed by '0' repeatedly until lenght is the given integer

def stringy(n)
  string = ''

  loop do
    break if n == 0
    if n == 1
      string << '1'
      break
    else
      string << '10'
    end

    n -= 2
  end

  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


# below is given soluation, modified to do the further exploration:
# add an optional argument, where when passed 0, the string will be 0101 instead of 1010
def stringy_given(size, start = 1)
  numbers = []

  size.times do |index|
    number = index.even? ? start : (start - 1) % 2
    numbers << number
  end

  numbers.join
end

puts stringy_given(6) == '101010'
puts stringy_given(9) == '101010101'
puts stringy_given(4) == '1010'
puts stringy_given(7) == '1010101'
puts stringy_given(6, 0) == '010101'
puts stringy_given(5, 0) == '01010'
