class Fruit
  def initialize(name)
    name = name        # this is a local variable, scoped to the method call itself, not the object
  end
end

class Pizza
  def initialize(name)
    @name = name       # this is an instance variable since it is prefixed by the @ symbol
  end
end

# The instance variable is scoped to the object, so @name will be available even
# after the call to initialize finishes. In the Fruit class, this will not be
# the case, since the `name` variable is simply a local variable, scoped to that
# method.
#
# We can use the #instance_variables method on an instance of the class to see
# what instance variables have been initialized.
