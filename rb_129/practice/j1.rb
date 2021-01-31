class Person
  attr_reader :name

  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name

# What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?
=begin
The output of this code will be actually be blanks because the call to `Person#name` returns `nil`.
This is because, although there is a getter method defined with `attr_reader` on `line 2`, the `@name` instance
variable is never initialized because we have not called `set_name`. This demonstrates that attempts to access and
uninitialized instance variable return `nil` whereas attempting to access an uninitialized local variable will throw an error.
=end
