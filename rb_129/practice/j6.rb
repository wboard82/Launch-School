class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name

# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?
=begin
In the `change_name` method, `name` is a local variable and not an instance variable. This means that it is initialized when Ruby
first identifies the local variable and creates it. The value is first set to `nil`. Then as Ruby attempts to execute the code on the
right side of the `=` it is referring to the local variable `name` and not the instance variable or getter method. They have been shadowed.
Since local variable `name` was just assigned to `nil`, it attempts to call `upcase` on `nil` which results in a `NoMethodError`.

To fix this we must refer to the instance variable or getter method by either using `@name` or `self.name` on the left side of the `=`.
Either of these will mean there is no local variable `name` defined that will shadow the call to the `#name` getter method.

=end
