def my_get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3.0
  case
  when 90 <= average && average <= 100 then "A"
  when 80 <= average && average < 90   then "B"
  when 70 <= average && average < 80   then "C"
  when 60 <= average && average < 70   then "D"
  else                           "F"
  end
end

def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3
  case average
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(70, 70, 70) == "C"
p get_grade(59, 59, 60) == "F"

#study using ranges in a case statement
