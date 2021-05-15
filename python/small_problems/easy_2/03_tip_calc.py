# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.

print("What is the bill?")
bill = float(input())

print("What is the tip percentage?")
percentage = float(input()) / 100

tip = round(bill * percentage, 2)
total = tip + bill

print(f"The tip is: {tip}")
print(f"The total is: {total}")

