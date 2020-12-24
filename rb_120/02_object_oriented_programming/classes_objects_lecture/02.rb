class Person
  attr_accessor :first_name, :last_name

  def initialize(first, last = '')
    @first_name = first
    @last_name = last
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end


bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'
