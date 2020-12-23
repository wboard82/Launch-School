
def last_digit_to_char(int)
  current_digit = int % 10
  current_digit += 48
  current_digit.chr
end

def integer_to_string1(int)
  string = ''

  loop do
    string.prepend(last_digit_to_char(int))

    int /= 10
    break if int == 0
  end

  string
end

INTEGERS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(integer)
  string = ''
  loop do
    integer, last_digit = integer.divmod(10)

    string.prepend(INTEGERS[last_digit])
    break if integer == 0
  end
  string
end


puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

