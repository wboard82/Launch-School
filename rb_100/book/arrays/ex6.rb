names = ['bob', 'joe', 'susan', 'margaret']

# next line causes error because array indexes must be integers.
# See one possible fix below.
# names['margaret'] = 'jody'

names[names.index('margaret')] = 'jody'
