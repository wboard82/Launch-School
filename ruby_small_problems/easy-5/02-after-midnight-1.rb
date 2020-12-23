# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any 
# integer input.
#
# - 1440 is 24 hours X 60 minutes per hour
#
# Integer -> String
#
# Explicit:
# - Input integer represents minutes offset from midnight
# - Postive integer means time after midnight
# - Negative integer meanst time before midnight
# - Return time in 24 hour format (hh:mm)
# - Do not consider daylight savings, etc
#
# Implicit:
# - Time wraps around if abs val of input is more than 1440
# - Midnight is "00:00" not "24:00"
#
# Questions:
# - Remind myself of the difference between remainder and modulo
#
# Data: Integers, Strings, Arrays?
#
# Algorithm:
# 1. Create 2 variables called hours and minutes
# 2. SET hours = input / 60
# 3. SET hours = hours % 24
# 4. SET minutes = input % 60
# 5. join hours and minutes into a string with ':' in the middle
#
SEC_PER_MIN = 60
MIN_PER_HOUR = 60
HRS_PER_DAY = 24

require 'pry'

def time_of_day(minute_offset)
  hours = (minute_offset / MIN_PER_HOUR) % HRS_PER_DAY
  minutes = minute_offset % MIN_PER_HOUR
  format("%02d:%02d", hours, minutes)
end

def time_of_day_2(minute_offset)
  sunday_midnight = Time.new(2020, 12, 20, 0)
  
  goal_time = sunday_midnight + (minute_offset * SEC_PER_MIN)
  goal_time.strftime("%A %H:%M")
end

puts time_of_day_2(-4231) == "Thursday 01:29"
puts time_of_day_2(0) == "Sunday 00:00"
puts time_of_day_2(1) == "Sunday 00:01"
puts time_of_day_2(-1) == "Saturday 23:59"

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

