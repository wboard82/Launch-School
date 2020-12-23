# intger (pos), boolean -> integer
# Takes a salary. If the boolean is true calculates the 50% bonus or returns 0

def calculate_bonus(salary, have_bonus)
  have_bonus ? (salary / 2) : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
