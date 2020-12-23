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
  string.bytes.inject(0) {|sum, byte| 10 * sum + byte_to_digit(byte)}
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

def hexadecimal_to_integer(string)
  string.upcase.bytes.inject(0) {|sum, byte| 16 * sum + byte_to_digit(byte) }
end

puts
puts hexadecimal_to_integer('4D9f') == 19871
