# select method call, operating on the array of hashes
# returns: new array of any hashes for which the block returns true
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  # call to all? on 'hash' which will be each hash in the outer array
  # returns true if the block never returns false/nil for any of the values in the hash
  hash.all? do |key, value|
    # value[0] returns the first character of each value in the hash
    # to_s is called on the key (which is a symbol) to convert it into a string
    # == called on the character from value[0] and returns true if it is equal
    # to the string equivalent of the key
    # return value is used by the block -- if any are false/nil, then all? will return false
    # if all? returns false, #select will not include that hash will not be included in the final array
    value[0] == key.to_s
  end
  # The only hash that returns true for all? is { c: 'cat' },
  # so that is selected and returned by select in a new array.
end
# => [{ :c => "cat" }]
