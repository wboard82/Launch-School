def palindromic_number?(num)
  num = num.to_s
  num == num.reverse
end

#Study - Look at the leading 0s problem

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(005) == false
