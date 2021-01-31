class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs')
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info
# => Spartacus weighs 10 lbs and is 12 inches tall.

# We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”`
# Why does our `change_info` method not work as expected?
=begin
The `change_info` method does not work as expected because `name`, `height`, and `weight` are local variables.
As Ruby is parsing the code it thinks we are initializing new local variables and so the values of `n`, `h`, and `w` are
assigned to local variables that only scoped to the method body.

In order to reassign the instance variables we can access them directly like this: `@name` or call the setter method like this:
`self.name=`. The `self` is necessary because Ruby defaults to creating a new local variable before checking to see if there is
an instance method `name=`.
=end
