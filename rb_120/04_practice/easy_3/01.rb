class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in the following cases?
hello = Hello.new
hello.hi          # => "Hello"

hello = Hello.new
#hello.bye         # => Error (no such method) - undefined method

hello = Hello.new
#hello.greet       # => Error (0 arguments) - wrong number of arguments

hello = Hello.new
hello.greet("Goodbye") # => Goodbye

Hello.hi          # => Error (not a class method) - undefined method in Hello class
