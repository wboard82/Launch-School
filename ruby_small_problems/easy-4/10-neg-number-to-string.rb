
def last_digit_to_char(int)
  current_digit = int % 10
  current_digit += 48
  current_digit.chr
end

def signed_integer_to_string(int)
  string = ''
  negative = false
  if int < 0
    negative = true
    int = -int
  end

  loop do
    string.prepend(last_digit_to_char(int))

    int /= 10
    break if int == 0
  end

  if negative
    string.prepend('-')
  elsif string != '0'
    string.prepend('+')
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

def signed_integer_to_string(int)
  abs_int = integer_to_string(int.abs)
  case int <=> 0
  when -1 then '-' + abs_int
  when 1 then '+' + abs_int
  else abs_int
  end
end
  

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

