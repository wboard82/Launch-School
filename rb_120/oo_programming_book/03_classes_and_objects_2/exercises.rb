# Add a class method that calculates the gas mileage of any car.

class MyCar
  attr_accessor :color
  attr_reader :year

  def self.gas_mileage(miles, gallons)
    puts "{miles / gallons} mpg."
  end

  def to_s
    "This car is a #{self.color} #{self.year} #{@model}."
  end

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
puts car
car.accelerate
car.accelerate(40)
car.brake(20)
car.turn_off

puts car.color
car.spray_paint("Black")
puts car.color
puts car.year
puts car
