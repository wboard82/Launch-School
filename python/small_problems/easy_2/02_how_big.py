# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.
#
# Note: 1 square meter == 10.7639 square feet
#
# Do not worry about validating the input at this time.

SQ_METERS_PER_FT = 10.7639

print("Enter the length of the room in meters:")
length = int(input())

print("Enter the width of the room in meters:")
width = int(input())

meters = round(length * width, 2)
feet = round(meters * SQ_METERS_PER_FT, 2)

print(f"The area of the room is {meters} square meters ({feet} square feet.)")
