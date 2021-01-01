class Cat
  attr_reader :name
  
  def self.generic_greeting
    puts "Hi! I'm a cat!"
  end

  def personal_greeting
    puts "Hi! My name is #{name} and I'm a cat."
  end

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
