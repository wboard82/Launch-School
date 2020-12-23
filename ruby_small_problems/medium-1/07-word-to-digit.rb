DIGITS_REGEX = /(zero|one|two|three|four|five|six|seven|eight|nine)/

STR_TO_DIGIT = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 
                'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}
require 'pry'

def my_word_to_digit(string)
  STR_TO_DIGIT.each do |word, digit|
    string.gsub!(/\b#{word}\b/, digit)
  end
  string
end


DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p my_word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

#study This is one to come back to with more regex experience
