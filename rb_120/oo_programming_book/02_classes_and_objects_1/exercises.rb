# Create a class called MyCar. Allow user to define some instance variables:
# User defined:
# year, color, model
# Auto:
# speed = 0
# Methods:
# speed up, brake, shut the car off
#

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(model, year, color)
    @model = model
    @year = year
    @color = color

    @speed = 0
  end

  def accelerate(speed_increase = 5)
    @speed += speed_increase
    puts "Accelerating by #{speed_increase}mph to #{@speed}mph."
  end

  def brake(speed_decrease = 5)
    @speed -= speed_decrease
    @speed < 0 ? @speed = 0 : @speed
    puts "Deccelerating by #{speed_decrease}mph to #{@speed}mph."
  end

  def turn_off
    @speed = 0
    puts "Parking the car!"
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "Painting this car #{new_color}."
  end
end

car = MyCar.new("Ford Mustang", 1999, "red")
p car
car.accelerate
car.accelerate(40)
car.brake(20)
car.turn_off

puts car.color
car.spray_paint("Black")
puts car.color
puts car.year
