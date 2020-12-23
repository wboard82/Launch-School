# Float -> String
# INPUT: Float representing the degrees of an angle
# OUTPUT: String with that angle in Degrees, Minutes, Seconds
# - 60 minutes in a degree
# - 60 seconds in a minute

DEGREE = "\xC2\xB0"
MIN_PER_DEG = 60
SEC_PER_MIN = 60
SEC_PER_DEG = MIN_PER_DEG * SEC_PER_MIN

# Algorithm:
#  - Variables: 'degrees', 'minutes', 'seconds', 'remainder'
#  - Extract the integer part of the angle and store it in 'degrees'
#  - Extract the decimal part and store it in 'remainder'
#  - Multiply 'remainder' by 60. Extract the integer part, store it in 'minutes'
#  - Extract the decimal part and store in 'remainder'
#  - Multiply 'remainder' by 60, extract the intger part and store in 'seconds'
#  - Use interpolation and concatentation to return the formated string

def my_dms(angle_f)
  degrees = angle_f.truncate
  decimal_minutes = (angle_f - degrees) * MIN_PER_DEG
  minutes = decimal_minutes.truncate
  seconds = ((decimal_minutes - minutes) * SEC_PER_MIN).truncate

  format(%(%d%s%02d'%02d"), degrees, DEGREE, minutes, seconds)
end

def dms(angle_float)
  total_seconds = (angle_float * SEC_PER_DEG) % (SEC_PER_DEG * 360)
  degrees, minutes = total_seconds.divmod(SEC_PER_DEG)
  minutes, seconds = minutes.divmod(SEC_PER_MIN)

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
