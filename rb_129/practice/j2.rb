module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim

# What is output and why? What does this demonstrate about instance variables?
=begin
This will not output anything because the call to `#swim` will return `nil`. This is because
`@can_swim` is never initialized and so the conditional on `line 11` will return `nil`. `@can_swim`
is never initialized because `enable_swimming` is never called and this is the only place that
initialization of this variable happens.

This demonstrates that instance variables are not automatically initialized when an object is created --
they must be initialized in a method call. In addition, accessing an uninitialized instance variable
results in `nil`.

=end
