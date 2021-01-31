class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels
p Vehicle.wheels

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels
p Car.wheels

# What does the code above output, and why? What does this demonstrate about class variables,
# and why we should avoid using class variables when working with inheritance?
=begin
The first call to p on `line 9` will be `4`. All 5 of the remaining calls to `p` will output `2`.
On `line 2` we initialize a class variable `@@wheels` to the Integer `4`. This is what is printed out when we call `p`
on `line 9`. On `line 12` we reassign `@@wheels` to `2`. Although `Motorcycle` is a different class, it shares one class variable
with `Vehicle` since it is a subclass. So, instead of having a `@@wheels` in `Vehicle` and another in `Motorcycle`, there is just
one `@@wheels` variable. This is true when adding a new subclass too, so `Car` shares the same class variable with it's
superclass `Vehicle` and its sibling class `Motorcycle`.
This demonstrates that a superclass shares one copy of its class variables with all its subclasses.



=end
