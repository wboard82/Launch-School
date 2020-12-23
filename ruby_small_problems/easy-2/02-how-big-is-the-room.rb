# user input (2 numbers) -> number (area) 
# takes a room width and length in meters
# returns the area of the room in square meters and square feet

def sqmeters_to_sqft(sqmeters)
  sqmeters * 10.7639
end

def area(width, length)
  width * length
end

puts "Enter the room width in meters:"
width = gets.chomp.to_f

puts "Enter the room length in meters:"
length = gets.chomp.to_f

area = area(width, length)

puts format("The area of the room is %.f square meters. (%.2f square feet.)",
            area, (sqmeters_to_sqft(area)))

