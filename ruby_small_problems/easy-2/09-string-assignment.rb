# What is the output of the following code?

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# => Alice
# => Bob

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# => BOB
# => BOB
