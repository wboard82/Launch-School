a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

# I thought it was 7
# However, it should be an error since methods are self-contained
