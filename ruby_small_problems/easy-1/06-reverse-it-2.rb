# string -> string
# Takes a string and returns the given string with words reversed if they have >= 5 letters 
#  - strings will be only letters and spaces
#  - at least one word
#  - spaces inluded only if multiple words

def reverse_words(string)
  string.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
