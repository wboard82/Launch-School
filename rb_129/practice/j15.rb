class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name

# What is output on `lines 14, 15, and 16` and why?

=begin
The output is:
```
Bob
My name is BOB.
BOB
```
On `line 14` we instantiate a new `Person` object with the `@name` variable set to `'Bob'` in the
`initialize` method. On `line 14` we output the return value of `bob.name` which is `'Bob'`.

On `line 15` we pass `bob` to `puts`. `puts` implicitly calls `to_s` on `bob` which results in calling
`upcase!` on the string referenced by `@name`. So, we not only have `BOB` interpolated into the string
on `line 9` being output, but the `@name` variable is mutated since `upcase!` is a mutating method.

This means that the value of `@name` is changed when we call `Person#name` again on `line 16` and output
the result.

=end
