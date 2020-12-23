first_name = 'John'
last_name = 'Doe'

full_name = "#{first_name} #{last_name}"
full_name2 = first_name + ' ' + last_name
full_name3 = ''.prepend(last_name).prepend(' ').prepend(first_name)
full_name4 = [first_name, last_name].join(' ')

puts full_name
puts full_name2
puts full_name3
puts full_name4

#study different methods of string concatenation
