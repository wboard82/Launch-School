class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

bag = Bag.new("orange", "suede")
# Here we call the ::new method on the class Bag to create a new instance of the
# class. ::new automatically calls #initialize when creating the new object.
