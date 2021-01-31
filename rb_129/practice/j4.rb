class AnimalClass
  attr_accessor :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def <<(animal)
    animals << animal
  end

  def +(other_class)
    result = AnimalClass.new("#{name} and #{other_class.name}")
    animals.each { |animal| result << animal }
    other_class.animals.each { |animal| result << animal }
    result
  end

  def to_s
    "#{name}: #{animals.map(&:to_s).join(", ")}"
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

puts some_animal_classes

# What is output? Is this what we would expect when using `AnimalClass#+`?
# If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?
#
=begin
The output is an array of animal objects. This is probably not what you would expect, given that most `+` methods return
an object of the same type. So, in this case we should prbably redefine the `+` to return a new `AnimalClass` object. This forces us
to consider what the `@name` variable will be for the new `AnimalClass` instance that is returned. I chose to put the two names together
with `"and"`.

I also included a `to_s` method in both classes so that the printout would be more pleasant and relevant.
=end
