=begin
A triangle is classified as follows:

- equilateral All 3 sides are of equal length
- isosceles 2 sides are of equal length, while the 3rd is different
- scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be
greater than the length of the longest side, and all sides must have lengths
greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending 
on whether the triangle is equilateral, isosceles, scalene, or invalid.

PROBLEM:
 * - a <= b <= c
 - equilateral a == b == c
 - isosceles a == b != c or a != b == c
 - scalene a != b != c
 * - a + b > c
 * - 0 <= a
 
 INPUT: Take lengths of the three sides as arguments (Integer or Float)
 OUTPUT: :equilateral, :isosceles, :scalene, or :invalid 

 DATA: Array, Numeric (integer or float), symbols

 ALG:
 - Given a, b, c (Numeric)
 - 'sorted_sides' = a, b, and c in an array and sort it
 - checks:
   - any <= 0? => return :invalid
   - return :invalid unless sored_sides[0] + sorted_sides[1] > sorted_sides[2] 
   - return :equilateral if a == c
   - return :isosceles if a == b || b == c
   - return :scalene
=end

def triangle(a, b, c)
  sorted_sides = [a, b, c].sort
  return :invalid if sorted_sides.any? { |side| side <= 0 }
  return :invalid unless sorted_sides[0] + sorted_sides[1] > sorted_sides[2]
  return :equilateral if sorted_sides[0] == sorted_sides[2]
  return :isosceles if sorted_sides[0] == sorted_sides[1]|| sorted_sides[1] == sorted_sides[2]
  return :scalene
end



p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(1.5, 3, 3) == :isosceles
p triangle(3, 1.5, 3) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
