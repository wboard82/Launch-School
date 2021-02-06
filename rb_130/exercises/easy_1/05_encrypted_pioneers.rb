def rot13(cypher_string)
  cypher_string.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

cyphered_names = File.readlines('cypher_names.txt', chomp: true)

cyphered_names.each do |cypher_name|
  puts rot13(cypher_name)
end

