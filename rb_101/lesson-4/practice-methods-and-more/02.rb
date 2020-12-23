['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# count uses the return value of the block to decided whether to count an element.
# Since this is true when a string length is < 4, the whole method call will return 2
