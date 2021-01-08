# Which of the following are objects in Ruby? (all of them)
# If they are objects, how can you find out what class they belong to?

a = true
b = "hello"
c = [1, 2, 3, "happy days"]
d = 142

p a.class # TrueClass
p b.class # String
p c.class # Array
p d.class # Integer
puts

c.each { |elem| p elem.class }
