ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.keys.include?("Spot")
p ages.has_key?("Spot")
p ages.any?("Spot")

p ages.keys.include?("Lily")
p ages.has_key?("Lily")
p ages.any? { |key, val| key == "Lily"}

#study Hash#include aliases
=begin
has_key?(key) → true or false
Methods has_key?, key?, and member? are aliases for #include?.

Returns true if key is a key in self, otherwise false.
=end
