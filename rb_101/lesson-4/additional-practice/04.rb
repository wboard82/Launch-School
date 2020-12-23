ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

p (ages.inject([nil, Float::INFINITY]) do |min, val|
     val[1] < min[1] ? val : min
   end)
#study this way of getting the whole record with the min value
