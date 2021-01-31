module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape

# What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?

=begin MD
The output of the first two calls to `p` will be 4. The last will be an error. The error occurs because Ruby first looks for constants
using lexical scope, then it looks up the inheritance chain, then in top-level definitions. In the case of the reference to `SIDES`
within the `describe_shape` method, there is no `SIDES` defined within the method or in the module. Ruby then tries to look up an
inheritance chain but will find nothing because the module `Describable` does not inherit from `Quadrilateral` where `SIDES` is defined.
There are also no top-level definitions, so Ruby throws an error.

In the case of the call to `Square.sides`, this is a class method. In this code:
```
def self.sides
  self::SIDES
end
```
both `self` keywords refer to the calling class, in this case `Square`. `Square` has inherited this method from `Shape`.
There is no `SIDES` defined within the lexical scope of the class, so Ruby begins to look up the chain of ancestors for the class.
Although `Square` does not have `SIDES` defined, the next place it looks is `Quadrilateral` which does have it defined and so
Ruby stops looking.

A similar thing happens in the call to `Square.new.sides`. Here we are calling an instance method: `Square#sides` which `Square` inherits
from `Shape`. Within the method, `self.class::SIDES` is calling `#class` on `self`. Here `self` refers to the instance that the method
is called upon. This will return `Square` and so Ruby looks for `Square::SIDES` which results in the same lookup chain as the previous call.
```

=end MD
