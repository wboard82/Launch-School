class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# This raised an exception because the call to `super` on `line 37` passed all
# the arguments to `super` by default since this call had no arguments or
# parentheses. However, the super class's intialize method only takes two
# arguments whereas this one takes three. So, we get an error when trying to
# call the `Animal#initialize` method with 3 arguments instead of 2.
#
# Examples
#

p unicornfish = Fish.new(:herbivore, 'breathe underwater')
p penguin = FlightlessBird.new(:carnivore, 'drink sea water')
p robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')
