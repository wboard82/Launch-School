require 'date'

puts "What age are you?"
age = gets.to_i

puts "What age would you like to retire?"
retirement_age = gets.to_i

years_left = retirement_age - age
current_year = Date.today.year
retirement_year = current_year + years_left

puts
puts "It is #{current_year}. You will retire in #{retirement_year}."
puts "You have #{years_left} years left to work!"
