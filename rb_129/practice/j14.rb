class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true

# In the code above, we want to compare whether the two objects have the same name.
# `Line 11` currently returns `false`. How could we return `true` on `line 11`?

# Further, since `al.name == alex.name` returns `true`, does this mean the `String`
# objects referenced by `al` and `alex`'s `@name` instance variables are the same object?
# How could we prove our case?

=begin
Since there is no `==` method defined for the `Person` class, it will rely on `BasicObject#==` which
compares whether two objects are the same object (equivalent to `equal?`). To return `true` when to
`Person` objects have the same name we would need to compare `al.name == alex.name` or define a `Person#==` method.

The string objects referenced by `al` and `alex` in their `@name` variables are not the same, even
though `==` returns true in this case. The `String#==` method overrides the `BasicObject` version and
returns `true` when two String objects have the same value, not just when they are the same object.

This could be shown by doing this:
`al.name.object_id == alex.name.object_id #=> false`

=end
