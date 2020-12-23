munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |key, val|
  case val["age"]
  when (0..17) then val["agr_group"] = "kid"
  when (18..64) then val["agr_group"] = "adult"
  else val["agr_group"] = "senior"
  end
end

puts munsters
  
