# String -> Integer
# Consumes a string that is in the form "HH:MM" and produces an integer
# that represents the number of minutes before (or after) midnight that time is
# 
# After midnight:
# 1. Parse the string and extract the hours and minutes
# 2. Convert to integers
# 3. Add (hours * 60) to the minutes and return that value
require 'time'

SEC_PER_MIN = 60
MIN_PER_HR = 60
HR_PER_DAY = 24
MIN_PER_DAY = MIN_PER_HR * HR_PER_DAY

def after_midnight(string_time)
  hours, mins = string_time.split(':').map(&:to_i)
  ((hours * MIN_PER_HR) + mins) % MIN_PER_DAY
end

def before_midnight(string_time)
  (MIN_PER_DAY - after_midnight(string_time)) % MIN_PER_DAY
end

def after_midnight(string_time)
  time = Time.parse(string_time)
  time.hour * MIN_PER_HR + time.min
end


puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
