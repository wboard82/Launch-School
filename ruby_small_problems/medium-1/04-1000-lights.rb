# Problem:
#  - Bank of n switches, connected to n lights, initially all off (false)
#  - Switches are numbered 1 to n
#  - n times:
#    - Walk down the switches and toggle every ith switch
#    - First time: every switch
#    - Second time: 2, 4, 6...
#    - Third time: 3, 6, 9...
#  - Write a method that takes one argument (the number of switched)
#  and returns an array that identifies which switches are on after n rounds
#  
#  INPUT: Positive Integer (number of switches)
#  OUTPUT: An array (representing the switches that are still on)
#
#  - Return values are not zero-based!!!
#
# Data Structure: Array

# Algorithm:
#  - Create an array `lights` of size n+1, with all values initialized to `false`
#  - From 1 upto n do:
#    - Set `counter` = current_num
#    - While counter <= n
#      - `lights[counter] = !lights[counter]`
#      - counter += current_num
#  - `Add index of any true value in `lights` into a result array
#  - Return result

def switches(n)
  lights = Array.new(n + 1) { false }
  1.upto(n) do |current_num|
    counter = current_num
    while counter <= n
      lights[counter] = !lights[counter]
      counter += current_num
    end
  end
  lights_left_on = []
  lights.each_with_index do |light, index|
    lights_left_on << index if light
  end
  lights_left_on
end

# Examples:
p switches(1) #== [1]
p switches(2) #== [1]
p switches(3) #== [1]
p switches(4) #== [1, 4]
p switches(5) #== [1, 4]
p switches(10) #== [1, 4, 9]
p switches(1000)
