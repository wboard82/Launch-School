module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def greet
    puts "My name is #{name} and I'm a cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = ('Luna')
kitty.greet
kitty.walk
