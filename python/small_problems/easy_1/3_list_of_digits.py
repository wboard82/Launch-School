def digit_list(num):
    return [int(x) for x in list(str(num))]

def digit_list(num):
    result = []

    while num:
        result.insert(0, num % 10)
        num = num // 10

    return result


print(digit_list(12345) == [1, 2, 3, 4, 5])     # => true
print(digit_list(7) == [7])                     # => true
print(digit_list(375290) == [3, 7, 5, 2, 9, 0]) # => true
print(digit_list(444) == [4, 4, 4])             # => true
