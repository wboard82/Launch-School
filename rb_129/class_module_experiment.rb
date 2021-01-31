module TestModule
  attr_accessor :c

  def initialize
    @c = 'c'
  end
end


class TestClass
  include TestModule

  attr_accessor :a, :b

  def initialize
    @a = 'a'
    @b = 'b'
    super
  end
end


