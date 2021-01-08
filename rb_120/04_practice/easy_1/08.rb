class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# make_one_year_older is an instance method of the class Cat. This means it can
# only be called on instances of the Cat class. Within a such a method call,
# `self` refers to the calling object.
