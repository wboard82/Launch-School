class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets.jump

# We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?

=begin
The error is raised because, on `line 28` we are attempting to call `jump` on the return from calling `pets`
on `bob`. This will return an array since the `@pets` instance variable is an array. There is no `Array#jump` method
so an error is raised. What is likely intended is to call:
```
bob.pets.each { |pet| pet.jump }
```
This way we are calling the `Pet#jump` method on each `Pet` object in the array referenced by `@pets`.

`kitty` and `bud` are collaborator objects with `bob`. Although the `@pets` instance variable points to
an Array, so that could be thought of as the collaborator object, the meaningful relationship is between
the `Person` object and each `Pet` object. The Array is just a method of structuring the data so that
each `Person` object can have more than one pet.
=end
