statement = "The Flintstones Rock"

letter_count = {}

statement.chars.uniq.sort.each do |letter|
  letter_count[letter] = statement.count(letter)
end

p letter_count

# Given solution:
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
