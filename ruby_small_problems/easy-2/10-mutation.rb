# What does the following code output?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
puts


# => Moe
# => Larry
# => CURLY
# => SHEMP
# => Harpo
# => CHICO
# => Groucho
# => Zeppo

array3 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array4 = []
array3.each { |value| array4 << value.dup }
array3.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array4
