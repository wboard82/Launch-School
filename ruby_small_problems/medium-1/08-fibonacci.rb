def fibonacci(nth)
  case nth
  when 1 then return 1
  when 2 then return 1
  else return fibonacci(nth-2) + fibonacci(nth-1)
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

#study Try the tail recursive version
