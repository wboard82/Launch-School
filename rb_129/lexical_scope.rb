module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
p a_car.change_tires                          # => NameError: uninitialized constant Maintenance::WHEELS
