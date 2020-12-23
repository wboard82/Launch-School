# How are File::path and File#path different?
# - The first is an class method and the second is an instance method, 
# to be called on an object


# What does the following code output:
require 'date'

puts Date.new
#=> -4712-1-1
puts Date.new(2016)
#=> 2016-1-1
puts Date.new(2016, 5)
#=> 2016-5-1
puts Date.new(2016, 5, 13)
#=> 2016-5-13


