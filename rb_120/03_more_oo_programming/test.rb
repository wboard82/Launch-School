class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                              # => 4

class Motorcycle < Vehicle
  self.@@wheels = 2
end

p Motorcycle.wheels                           # => 2
p Vehicle.wheels                              # => 2  Yikes!
