def ascii_value(string)
  string.chars.reduce(0) { |sum, char| sum += char.ord }
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# Further exploration answers:
# char.ord.chr == char
# When char is a longer string, ord only returns the value of the first character.
