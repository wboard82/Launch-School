# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all
# numbers between 1 and the entered integer.
import math

print("Please enter a positive whole number:")
num = int(input())

print(f"Would you like the (s)um or (p)roduct of all the numbers between 1 and {num}?")

while True:
    choice = input()
    if choice.lower() in ['s', 'p', 'sum', 'product']:
        break
    print(f"I'm sorry, '{choice}' was not a valid input. Please try again")

if choice[0] == 's':
    print(f"{sum(range(1, num + 1))}")
else:
    print(f"{math.prod(range(1, num + 1))}")

