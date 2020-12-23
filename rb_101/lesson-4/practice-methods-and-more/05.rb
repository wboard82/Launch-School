hash = { a: 'ant', b: 'bear' }
hash.shift

# What does shift do in this code?
# Shift will take the first element and return it.
# Shift is destructive so after the call, hash = { b: 'bear' }
# the return values is [:a, 'ant']
