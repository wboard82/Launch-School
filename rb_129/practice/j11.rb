class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

# What is output and why? How does this code demonstrate polymorphism?

=begin
The output is:
```
I eat.
I eat plankton.
I eat kibble.
```

In this code we have three objects of different classes instantiated on `line 23` and placed into an array
that is assigned to `array_of_animals`. We call `each` on this array, passing each of the elements to
the block. Inside the block each element is passed as an argument to the `feed_animal` method where we
call each object's `eat` method.

Since each object is of a different class, Ruby will look for the `eat` method in each object's respective
class. So, although line `20` only has a call to the `eat` method, it calls `Animal#eat`, `Fish#eat`, and
`Dog#eat` as we call `eat` on each object.

This is a classic example of polymorphism where we are able to use the same method name on three different
objects and it results in the appropriate method call for each object.

=end
