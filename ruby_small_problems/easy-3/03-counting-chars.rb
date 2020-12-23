# Ask the user for a word or multiple words.
# Returns the number of characters.
# Spaces are not counted as characters.

print "Please enter a word or multiple words: "
words = gets.chomp

puts "There are #{words.count("^ ")} characters in '#{words}'."

# Also could use: words.delete(' ').size
