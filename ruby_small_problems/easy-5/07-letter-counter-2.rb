# Problem:
#   String  -> Hash (keys: Ints, vals: Ints)
#   - Take a string of space separated words.
#   - Return a hash with the number of words of different lengths in the string.
#   - Words are any string of characters that don't include a space
#   - Empty string produces an empty hash
#   - Punctuation is part of each word
#   - Key of hash is length of word
#   - Val of hash is the count of those lengths
# 
# Data:
#   String, Hash, Array
#
# Algorithm:
#   - 'words' = Split the given string into an array at the spaces
#   - 'sizes' = An array containing the length of each word in 'words'
#   - create emtpy hash 'size_counts'
#   - take each unique value from 'sizes' and count how many times it appears in 'sizes'
#   - put that information into a 'size_counts', with the size as the key and count as the value
#   - return that hash

def my_word_sizes(string)
  word_lengths = string.split.map { |word| word.size }
  size_counts = {}
  word_lengths.uniq.each { |length| size_counts[length] = word_lengths.count(length)}
  size_counts
end

# Given solution
def word_sizes(string)
  word_lengths = Hash.new(0)
  string.gsub(/[^a-zA-Z ]+/, '').split.each do |word|
    word_lengths[word.size] += 1
  end
  word_lengths
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
