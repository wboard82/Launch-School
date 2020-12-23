def real_palindrome1?(string)
  comp_string = string.downcase.gsub(/[^a-zA-Z0-9]/, '')
  comp_string == comp_string.reverse
end

def real_palindrome?(string)
  comp_string = string.downcase.delete('^a-z')
  comp_string == comp_string.reverse
end


puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
