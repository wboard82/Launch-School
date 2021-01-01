require 'pry'

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{@type} named #{@name}"
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end
  
  def print_pets
    puts @pets
  end

  def number_of_pets
    @pets.size
  end
end


class Shelter
  def initialize(pets = [])
    @owners = Hash.new()
    @pets = pets
  end

  def add_pet(pet)
    @pets << pet
  end

  def adopt(owner, pet)
    unless @pets.delete(pet)
      puts "#{pet} is not available for adoption."
      return
    end

    owner.add_pet(pet)
    @owners[owner.name] ||= owner
  end

  def print_adoptions
    @owners.each do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end

    puts "The Animal Shelter has the following unadopted pets:"
    puts @pets
    puts
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')
rex          = Pet.new('dog', 'Rex')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

available_pets = [butterscotch, pudding, darwin, kennedy, sweetie, molly, chester,
                  asta, laddie, fluffy, kat, ben, chatterbox, bluebell]

shelter = Shelter.new(available_pets)
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.adopt(bholmes, rex)
shelter.add_pet(rex)
shelter.adopt(bholmes, rex)
puts

shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

