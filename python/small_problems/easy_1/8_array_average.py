def average(lst):
    return sum(lst) // len(lst)

print(average([1, 6]) == 3) # integer division: (1 + 6) / 2 -> 3
print(average([1, 5, 87, 45, 8, 8]) == 25)
print(average([9, 47, 23, 95, 16, 52]) == 40)
