class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# The @@cats_count variable is a class variable. When the class is created, the
# variable is initialized to 0. Then, each time a new instance of the class is
# created and `initialize` is called, the @@cats_count variable is incremented
# with a call to the += method. This means that each time a new Cat is created,
# the cats_count will be increased by 1.

p Cat.cats_count
Cat.new("maltese")
Cat.new("thunder")

p Cat.cats_count
