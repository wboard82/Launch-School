def stringy(num):
    return "".join(["1" if x % 2 == 0 else "0" for x in range(num)])

print(stringy(6) == '101010')
print(stringy(9) == '101010101')
print(stringy(4) == '1010')
print(stringy(7) == '1010101')
