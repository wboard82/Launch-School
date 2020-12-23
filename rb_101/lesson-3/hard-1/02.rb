#study - this problem again
greetings = { a: 'hi' }
p greetings[:a].object_id
informal_greeting = greetings[:a]
p informal_greeting.object_id
informal_greeting << ' there'
p informal_greeting.object_id

puts informal_greeting  #  => "hi there"
puts greetings
