=begin
INPUT: Integer (2 or greater) (the number of digits we are looking for)
OUTPUT: Integer (the index, or number in fib sequence where a number of that length first appears)
DATA: Integers (convert to strings) (possibly use array if need to store numbers)
ALGORITHM:
  - Given 'length' parameter
  - Set 'index' to 3
  - Set 'num1' and 'num2' each to 1
  - LOOP:
    - SET 'next_num' to next_fib(num1, num2)
    - IF 'next_num' length is equal to 'length'
      - Return 'index'
    - ELSE
      - increment index
      - num1 = num2
      - num2 = next_num
=end

def next_fib(num1, num2)
  num1 + num2
end

def find_fibonacci_index_by_length(length)
  index = 3
  num1 = 1
  num2 = 1
  loop do
    next_num = next_fib(num1, num2)
    return index if next_num.to_s.length >= length

    num1 = num2
    num2 = next_num
    index += 1
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
