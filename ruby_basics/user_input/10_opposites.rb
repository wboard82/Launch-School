# - Request 2 integers
# - Add together
# - Display result
# - Insist one be positive and the other negative, order doesn't matter
# - Check for positive/negative after both are entered, start over if not met

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_valid_number()
  loop do
    puts "Please enter a positive or negative integer: "
    input = gets.chomp
    return input.to_i if valid_number?(input)                   #study: this was better than using if/else and break
    puts "Only non-zero integers are allowed. Please try again."
  end
end


loop do
  int1 = get_valid_number
  int2 = get_valid_number
  sum = int1 + int2

  if sum < int1.abs + int2.abs
    puts "#{int1} + #{int2} = #{sum}"
    break
  end

  puts "Sorry, please enter one positive and one negative number."
  puts "Please start over."
end

