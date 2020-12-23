def swap_first_and_last_letter(word)
  word[0], word[-1] = word[-1], word[0]
end

def swap(string)
  words = string.split
  words.each do |word|
    swap_first_and_last_letter(word)
  end
  words.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
