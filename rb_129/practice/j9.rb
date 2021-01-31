class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")

# What is output and why? What does this demonstrate about `super`?
=begin
This will throw an error. The reason is that on `line 8` we attempt to call `Animal#initialize` using the `super`
keyword. However, when used with no arguments or parentheses, it passes all arguments of the current
method to the super class method. Since the string `"black"` has been passed into `Bear#initialize`, `super` will
pass that to `Animal#initialize`.

`Animal#initialize` does not take any arguments so there will be an argument error.
=end
