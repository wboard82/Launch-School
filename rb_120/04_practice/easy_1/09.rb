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

# In the name of the cats_count method, `self` refers to the class, since this
# is outside of an instance method. So, that means that `cats_count` is a class
# method that can be called on any instance of the class or the class itself.
