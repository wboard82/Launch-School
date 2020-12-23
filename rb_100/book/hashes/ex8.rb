words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

=begin
Write a program that prints out groups of words that are anagrams. Anagrams are
words that have the same exact letters in them but in a different order. Your 
output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
(etc)]
=end

# Below is the code I wrote the next morning, without looking at the given solution (below). 
# I forgot the '?' for has_key, but otherwise I was able to reconstruct the solution
# from memory by writing some psuedocode.

# Create result hash to store the groups of words in
result = {}

# Loop over each element in words
#  1. Split them, sort, and join the words - store as key
#  2. Use key and see if it is already in result
#       If it is, push word onto value
#       Else, make a new key:value pair in result

words.each do |word|
  key = word.split("").sort.join

  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "-----------------------------"
  p v
end


# On 10/13/20 I got part of this on my own and then peaked at the solution and tried
# to recreate without looking back too much. I should come back to this!!!

result = {}

words.each do |word|
  key = word.split("").sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "---------------"
  p v
end

