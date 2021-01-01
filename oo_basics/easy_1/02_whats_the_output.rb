class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

puts

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

=begin
In the above code, the local variable `name` is initialized to the integer 42. `name` is then passed
as an argument to the `Pet#initialize` method. Within the method, the parameter `name` is initialized
to point to the same integer, `42`. We then call the `to_s` method on this integer, which returns a
new string with the value `'42'`.
The instance variable `@name` is assigned to this string. This means
that `@name` and the local variable `name` that was assigned to integer `42` are no longer pointing to
same object.
When we call the `+=` method on `name`, passing `1` as an argument, this reassigns the local variable
`name` but has no effect on the instance variable `@name`.

However, when a string is passed to the `initialize` method, the call to `to_s` returns the same string,
which means that the instance variable and the local variable from outside the class will remain pointing
to the same object and mutations to either one will affect the other.
=end

#study try rewriting this example

