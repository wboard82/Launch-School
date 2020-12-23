def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# The difference is that the first mutates the buffer variable after the method returns.
# The second does not because of the reassignment.
# 
# This was my original answer.
# There is not a difference between these two because Alyssa has put the
# new_element into an array. If she had just concatenated it on with '+',
# there would have been a difference when new_element was an array. In that case
# '+' would have concatentated the actual elements of new_element whereas
# << would have appended the list as an element itself.
#
#
#study: Review because I got this wrong. Look at difference between << and + in methods
