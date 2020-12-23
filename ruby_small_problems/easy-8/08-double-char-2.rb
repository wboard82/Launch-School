def double_consonants(string)
  string.gsub(/([bcdfghjklmnpqrstvwxyz])/i, '\1\1')
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
