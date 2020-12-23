# Use each to output the vowels from all the strings:

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, strings|
  strings.each do |word|
    puts word.delete("^aeiouAEIOU")
  end
end
