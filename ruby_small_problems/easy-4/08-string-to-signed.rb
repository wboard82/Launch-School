def byte_to_digit(byte)
  if byte >= 'A'.ord
    byte - 55
  else
    byte - 48
  end
end

def string_to_integer1(string)
  number = 0
  place = 1
  bytes = string.bytes
  loop do
    break if bytes.empty?
    number += byte_to_digit(bytes.pop) * place
    place *= 10
  end

  number
end

def string_to_integer2(string)
  number = 0
  place = 1
  string.bytes.reverse.each do |byte|
    number += byte_to_digit(byte) * place
    place *= 10
  end

  number
end

def string_to_integer3(s)
  s.bytes.reverse.each_with_index.inject(0) {|sum, (b, i)| sum += (b - 48) * (10 ** i)}
end

def string_to_integer(string)
  string.bytes.inject(0) {|sum, byte| sum = 10 * sum + byte_to_digit(byte)}
end

def string_to_signed_integer(string)
  if string[0] == '-'
    return 0 - string_to_integer(string.delete('-'))
  end
  if string[0] == '+'
    string.delete!('+')
  end
  string_to_integer(string)
end

def hexadecimal_to_integer(string)
  string.upcase.bytes.inject(0) {|sum, byte| 16 * sum + byte_to_digit(byte) }
end

def hexadecimal_to_signed_integer(string)
  match_data = /([\-\+])?([\da-f]+)/.match(string.downcase)
  num = hexadecimal_to_integer(match_data[2])
  (match_data[1] == '-') ? (-num) : num
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

puts hexadecimal_to_signed_integer('4D9f') == 19871
puts hexadecimal_to_signed_integer('+4D9f') == 19871
puts hexadecimal_to_signed_integer('-4D9f') == -19871
