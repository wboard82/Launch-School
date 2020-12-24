class Person
  attr_accessor :name

  def initialize(n)
    @name = n
  end
end



bob = Person.new('bob')
puts bob.name                  # => 'bob'
bob.name = 'Robert'
puts bob.name                  # => 'Robert'
