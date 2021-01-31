# What are the use cases for `self` in Ruby, and how does `self` change based
# on the scope it is used in? Provide examples.

=begin
`self` in Ruby can refer either to the calling object, or the class depending on where it is used.
In a class defintion, if we find `self` outside of a method definition, it is referring to the class
itself. This can be useful especially for defining class methods (see below). `self` inside a class
method definition will also refer to the class.

If `self` appears within an instance method definition, it refers to the calling object. This can
be useful to return the calling object itself. This can also be used to access setter methods
that would otherwise be interpreted by Ruby as initialization of a new local variable.
=end

class Car
  attr_accessor :running

  def initialize
    @running = false
  end

  def self.runs_on        # self here refers to Car, so this is a class method definition
    puts "#{self}s run on gasoline!" #self here refers to Car since we're inside a class method def.
  end

  def turn_on
    self.running = true   # running = false would create a new local varaible
    puts "Vrroooom!"
    self
  end
end

Car.runs_on
Car.new.turn_on
