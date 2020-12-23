def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil

loop do
  puts "Please enter the numerator: "
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid entry! Only integers are allowed."
end

loop do
  puts "Please enter the denominator: "
  denominator = gets.chomp
  if !valid_number?(denominator)
    puts "Invalid entry! Only integers are allowed."
  elsif denominator.to_i == 0
    puts "Invalid entry! Denominator may not be zero."
  else
    break
  end
end

puts "#{numerator} / #{denominator} = #{numerator.to_i / denominator.to_i}"

