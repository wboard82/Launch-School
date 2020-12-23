# Write a program that solicits six numbers from the user.
# Then prints a message that says whether the sixth number appears in the first 5.

def ordinal(num)
  ending = case num % 100
           when 11, 12, 13 then 'th'
           else
             case num % 10
             when 1 then 'st'
             when 2 then 'nd'
             when 3 then 'rd'
             else 'th'
             end
           end
  num.to_s + ending
end

numbers = []
(1..5).each do |i|
  puts "=> Enter the #{ordinal(i)} number:"
  number = gets.to_i
  numbers << number
end

puts "=> Enter the final number:"
final_number = gets.to_i

if numbers.include?(final_number)
  puts "#{final_number} is in #{numbers}."
else
  puts "#{final_number} is not in #{numbers}"
end

