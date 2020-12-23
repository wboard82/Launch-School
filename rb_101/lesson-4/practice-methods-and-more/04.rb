['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end


# What is the return value of each_with_object?
# { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# each_with_object returns the object that is passed in as a parameter.
# In this case we add to the hash each value with the virst letter of that
# value as the key.
