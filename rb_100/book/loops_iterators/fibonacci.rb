# recursive fibonnaci - trying on my own before looking at book


def fib(n)
  if n == 0
    return 1
  elsif n == 1
    return 1
  else
    return fib(n - 1) + fib(n - 2)
  end
end

