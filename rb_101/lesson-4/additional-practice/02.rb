# Add up all the ages
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum
p ages.reduce(0) { |sum, (key, val)| sum += val}
p ages.values.inject(:+)
sum_ages = 0
ages.each {|_, val| sum_ages += val}
p sum_ages 
