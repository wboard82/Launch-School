module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end

  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk
p good_dog.class.ancestors

# What is the method lookup path used when invoking `#walk` on `good_dog`?
=begin
[GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable, Object, Kernel, BasicObject]
The method is found in `Walkable`. This demonstrates how Ruby begins with the object's class.
It then continues to any modules included in the class (from last included to first include).
The lookup then continues to the super class, it's included modules, all the way up the inheritance
chain until it either finds the method or the method cannot be found in BasicObject.

=end
