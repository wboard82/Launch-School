class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno

# What is output and why? What does this demonstrate about `super`?
=begin
The output will be a string representation of the object `bruno`. This will include the
memory address and the names and values of two instance variables:
`@name = "brown"` and `@color = "brown"`
This happens because on `line 16` we instantiate a new `GoodDog` object by calling `GoodDog::new`.
We pass the string `"brown"` as an argument. This is eventually passed to `GoodDog#initialize`.
On `line 11` there is a call to `super` which calls `initialize` from the parent class. When `super` is
invoked with no arguments, all the arguments passed into the current method call are passed to the call
to `super` as well. This means that `"brown"` is passed as an argument to `Animal#initialize` where the
instance variable `@name` is initialized to `"brown"`. After the call to `super`, we also initialize `@color`
to `"brown"`.
This demonstrates that calls to `super` without any arguments or parentheses will pass all arguments passed
to the current method to the superclass method.


=end
