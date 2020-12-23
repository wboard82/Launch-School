def digit_list(number)
  digits = number.to_s.split('')
  digits.map! { |s| s.to_i } 
end

def digit_list2(number)
  digits = []
  while number > 0 
    digits.unshift(number % 10)
    number = number / 10
  end
  digits
end

def digit_list_given(number)
  number.to_s.chars.map(&:to_i)
end
  

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
puts "-----------------------"

puts digit_list2(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list2(7) == [7]                     # => true
puts digit_list2(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list2(444) == [4, 4, 4]             # => true
puts "-----------------------"

puts digit_list_given(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list_given(7) == [7]                     # => true
puts digit_list_given(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list_given(444) == [4, 4, 4]             # => true
