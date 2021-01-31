require 'pry'

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
    binding.pry
  end

  def to_s
    "a good dog name #{name} who is #{age} dog years old!"
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky

# What is output and why? How could we output a message of our choice instead?

# How is the output above different than the output of the code below, and why?
puts "----"

class GoodDog2
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog2.new("Sparky", 4)
p sparky
