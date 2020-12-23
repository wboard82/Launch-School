REGEX_VOWELS = /[aeiouAEIOU]/
VOWELS = "AEIOUaeiou"

def my_remove_vowels(strings)
  strings.map do |str|
    str.gsub(REGEX_VOWELS, '')
  end
end

def remove_vowels(strings)
  strings.map { |str| str.delete(VOWELS) }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
