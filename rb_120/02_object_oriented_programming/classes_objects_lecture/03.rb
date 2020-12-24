class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    self.name=(n)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(n)
    n = n.split
    @first_name = n[0]
    @last_name = n.size > 1 ? n[1] : ''
  end

  def to_s
    name
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts
puts bob.name == rob.name

puts
puts "The person's name is: #{bob}"
