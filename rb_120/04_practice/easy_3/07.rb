class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

# The `return` keyword in `self.information` does not add any value.
# `attr_accessor` methods are not used within the class but could be used
# outside of it.
