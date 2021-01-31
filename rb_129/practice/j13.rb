class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name

# What is output and why?

=begin
The output for this program will be "bark! bark! bark! bark!".
This happens because `@name` returns `nil` since it was not initialized.
Although `"Teddy"` is passed to `Dog#initialize` through the call to
`Dog::new` on `line 15`, it is never assigned to an instance variable. The body of `Dog#initialize` is empty.
In order to assign `@name` to the object referenced by the method parameter `name`, we would need to add
one of two things to `Dog#initialize`
1. `@name = name`
or
2. `super`
Alternatively, we could get rid of `Dog#initialize` altogether and when `Dog::new` called `Dog#initialize`
on our new object, it would follow the method lookup chain and find `Animal#initialize` where the instance
variable would be initialized.
=end
