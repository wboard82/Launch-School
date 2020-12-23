
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

# Take the above array and turn it into a new array that consists of strings containing one word.

b = []

a.each do |words|
  w = words.split
  b.push(w)
end

b.flatten!
p b
  
