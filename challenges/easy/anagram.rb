class Anagram
  def initialize(string)
    @string = string
    @sorted_letters = string.downcase.chars.sort
  end

  def match(list)
    list.select do |word|
      @sorted_letters == word.downcase.chars.sort &&
        !@string.casecmp?(word)
    end
  end
end
