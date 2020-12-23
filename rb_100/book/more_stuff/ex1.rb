
# Write a program that checks if the sequence of characters "lab" exists in the 
# following strings. If it does exist, print out the word.

words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

puts "Words = #{words}"
puts "The following words have 'lab' inside them:"

words.each do |word|
  if word =~ /lab/
    puts word
  end

end


