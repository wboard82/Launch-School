# - Break string into characters
# - Use map to convert array to new array:
#   - If char in range A-Z, use downcase
#   - If char in range a-z, use upcase
#   - Else use char
# - Join array back to string

def my_swapcase(string)
  string.chars.map do |char|
    if ('A'..'Z').cover?(char)
      char.downcase
    elsif('a'..'z').cover?(char)
      char.upcase
    else
      char
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
