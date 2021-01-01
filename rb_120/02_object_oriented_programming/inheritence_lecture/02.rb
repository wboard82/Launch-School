class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

puts pete.run                # => "running!"
#pete.speak              # => NoMethodError

puts kitty.run               # => "running!"
puts kitty.speak             # => "meow!"
#kitty.fetch             # => NoMethodError

puts dave.speak              # => "bark!"
bud.run                 # => "running!"
bud.swim                # => "can't swim!"


=begin
Question 3:

                    Pet (run, jump)
                    /         \
                   /           \
                Dog             Cat (speak)
          (speak, fetch, swim)
                /
               /
            Bulldog
            (swim)



Question 4:
What is the method lookup path and how is it important?

The method lookup path determines where and in what order Ruby will try to find a method when it is called on an object.
It begins with the object's class, then with any mixins (in the reverse order of how they were defined).
If no method of the correct name is found, it will continue to the super class, and its mixins, and so on, all the 
way until it reaches the class BasicObject. Ruby will invoke the first method it finds in this path and stop searching.

This is important because there may be multiple methods with the same name within the class heirarchy and we need
to know which one will be called for a specific object.

For instance, calling #speak on an instance of the Dog class will call the `speak` method from the `Dog` class. However,
calling it on a Bulldog object will result in the `Bulldog#speak` method being called, since the method was overridden
in the `Bulldog` class.
=end


