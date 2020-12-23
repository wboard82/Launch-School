# String -> String
# Takes a string and returns a new string that contains the old string where
# each consecutive character is condensed to one
# - empty string -> empty string
# - no double letters -> new string, that is a copy
# - numbers are included (assume other characters as well)

# Data: use an array of characters
# Alg:
# - Create new_string = ''
# - Create current_character = ''
# - Split string into array of characters
# - For each character |char|:
#   - if it is equal to current_character, keep going
#   - if it is not equal, set current_character to `char`, and append `char` on `new_string`
# - Return `new_string`

def crunch1(string)
  new_string = ''
  current_char = ''
  string.chars.each do |char|
    if char != current_char
      current_char = char
      new_string << char
    end
  end

  new_string
end

def crunch2(string)
  current_char = ''
  string.chars.each_with_object('') do |char, new_string|
    if char != current_char
      current_char = char
      new_string << char
    end
  end
end

def crunch_given(string)
  index = 0
  crunch_text = ''
  while index <= string.length - 1
    crunch_text << string[index] if string[index] != string[index + 1]
    index += 1
  end

  crunch_text
end

#study - try this with Regex

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
