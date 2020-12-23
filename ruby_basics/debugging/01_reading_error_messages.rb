def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0)
find_first_nonzero_among(1)
# Error message: 
# 01_reading_error_messages.rb:1:in `find_first_nonzero_among': wrong number of arguments (given 6, expected 1) (ArgumentError)
#
# This means that the call on line 9 to #find_first_nonzero_among was given too many arguments.
# The numbers should have been passed as an array instead of a list of arguments.
