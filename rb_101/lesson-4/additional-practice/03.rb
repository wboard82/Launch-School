ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p (ages.reject { |name, age| age >= 100 })
p ages

ages.keep_if { |_, age| age < 100 }

p ages
