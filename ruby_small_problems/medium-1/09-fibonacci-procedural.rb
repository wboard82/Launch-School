def fibonacci(n)
  last, curr = [1, 1]
  3.upto(n) do
    last, curr = [curr, last + curr]
  end
  curr
end

=begin
  counter = 1
  fib_prev = 0
  fib_curr = 1

  loop do
    return fib_curr if counter == n
    fib_next = fib_prev + fib_curr
    fib_prev = fib_curr
    fib_curr = fib_next
    counter += 1
  end
end
=end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
