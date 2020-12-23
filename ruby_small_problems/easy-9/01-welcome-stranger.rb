# Array and hash -> String
# Array: 2+ elements, combine with spaces to create person's name
# Hash: :title and :occupation
# Return a greeting with the person's full name, title and occupation.


def greetings(name, info)
  "Hello, #{name.join(' ')}! Nice to have a #{info.values.join(' ')} around."
end


p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
