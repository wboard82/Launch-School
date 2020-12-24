class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end

  def speak
    super + " from GoodDog class."
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

bruno = GoodDog.new("brown")
p bruno

p BadDog.new(2, "bear")
