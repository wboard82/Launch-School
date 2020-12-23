# Sort this array by descending numeric value

arr = ['10', '11', '9', '7', '8']
sorted = arr.sort do |str1, str2|
  str1.to_i <=> str2.to_i
end

p sorted

