class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

str = 'xyz'
expander = Expander.new(str)
puts expander
str.upcase!
puts expander
