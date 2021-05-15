def sum(num):
    result = 0

    while num:
        result += num % 10
        num //= 10

    return result


print(sum(23) == 5)
print(sum(496) == 19)
print(sum(123_456_789) == 45)
