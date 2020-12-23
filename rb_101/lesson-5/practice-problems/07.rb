# What is the final value of a and b?

a = 2
b = [5, 8]
arr = [a, b]     # [2, [5, 8]]

arr[0] += 2      # arr = [4, [5, 8]], a = 2, b = [5, 8]
arr[1][0] -= a   # arr = [4, [3, 8]], a = 2, b = [3, 8]
p a
p b
p arr
