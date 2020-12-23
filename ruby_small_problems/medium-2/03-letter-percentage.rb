=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Problem:
IN/OUT: String --> hash {lowercase: int, uppercase: int, neither: int} 
  - each entry in the hash represents the percentage occurances in the string of the corresponding cases

RULES:
 - One percentage for uppercase
 - One percentage for lowercase
 - One for neither
 - may assume string is at least one character long (don't worry about div by 0)
 - Return a hash
 
DATA:
 - Variables to hold counts of each and total chars
 - Create hash at the end or at the beginning and then convert to % at the end?
 
ALG:
 - Create three variables to hold the counts of lower, upper, and neither
 - Createa a variable 'total' and set it to the length of the string
 - Split the input string into an array of characters
 - For each character:
   - Check to see if it is uppercase, if so, increment the upper count
   - Check to see if it is lowercase, if so, increment the lower count
   - Otherwise, increment the neither count
 - After iterating, create and return a hash with three entries, by dividing each count by 'total'
=end

def letter_percentages(string)
  upper_count, lower_count, neither_count = 0, 0, 0
  total = string.length.to_f
  
  string.chars.each do |char|
    if ('A'..'Z').cover?(char)
      upper_count += 1
    elsif ('a'..'z').cover?(char)
      lower_count += 1
    else
      neither_count += 1
    end
  end
  
  { lowercase: 100 * lower_count / total,
    uppercase: 100 * upper_count / total,
    neither: 100 * neither_count / total }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
