# Turn into a hash where the names are the keys and the value is the positoin
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]


flintstones_hash = {}
flintstones.each_with_index do |element, index|
  flintstones_hash[element] = index
end

p flintstones_hash
