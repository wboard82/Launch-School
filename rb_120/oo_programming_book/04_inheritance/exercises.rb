class Vehicle
  @@vehicle_count = 0

  attr_accessor :color
  attr_reader :year

  def initialize(model, year, color)
    @@vehicle_count += 1

    @model = model
    @year = year
    @color = color

    @speed = 0
  end

  def self.display_count
    case @@vehicle_count
    when 0 then puts "There are no vehicles on the road."
    when 1 then puts "There is 1 vehicle on the road."
    else puts "There are #{@@vehicle_count} vehicles on the road."
    end
  end

  def age
    self.calculate_age
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
    puts "Parking the vehicle!"
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "Painting this vehicle #{new_color}."
  end

  def to_s
    "A #{@color}, #{@year} #{@model}."
  end

  private

  def calculate_age
    require 'date'
    Date.today.year - @year
  end
end

module Carryable
  def load(item)
    @load << item
    self
  end

  def unload(item)
    @load.delete(item)
    self
  end

  def load_list
    return "carrying nothing" if @load.empty?
    return "carrying #{@load.first}" if @load.size == 1
    
    list = @load[0..-2].join(', ') + ", and " + @load.last
    "carrying #{list}"
  end
end

class MyCar < Vehicle
  MAX_WEIGHT = 5000

  def initialize(model, year, color)
    super(model, year, color)
  end
end

class MyTruck < Vehicle
  include Carryable
  MAX_WEIGHT = 8000


  def initialize(model, year, color)
    super(model, year, color)
    @load = []
  end

  def to_s
    super.chop + " " + self.load_list + "."
  end
end

Vehicle.display_count
car = MyCar.new("Ford Mustang", 1999, "Red")
puts car
Vehicle.display_count
puts

truck = MyTruck.new("Chevy Silverado", 2008, "Black")
puts truck
Vehicle.display_count

puts truck.load("3 sheets of plywood")
puts truck.load("16 two-by-fours")
puts truck.unload("3 sheets of plywood")

puts MyCar.ancestors
puts MyTruck.ancestors

puts "The truck is #{truck.age} years old."
puts "The car is #{car.age} years old."
