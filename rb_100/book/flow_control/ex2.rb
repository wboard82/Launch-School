# Write a method that takes a string as argument. The method should return a new,
# all-caps version of the string, only if the string is longer than 10 characters.

def cap_if_longer(str)
  if str.length > 10
    str.upcase
  else
    str
  end
end


puts "cap_if_longer 'hello' = #{cap_if_longer 'hello'}"
puts "cap_if_longer 'this string is > 10' = #{cap_if_longer 'this string is > 10'}"

