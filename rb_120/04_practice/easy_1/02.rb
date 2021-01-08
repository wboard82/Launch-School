module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast
Truck.new.go_fast

# Question 3: When we called the go_fast method from an instance of the Car 
# class (as shown below) you might have noticed that the string printed when we 
# go fast includes the name of the type of vehicle we are using. How is this done?
#
# This is done in the go_fast method by calling the #class method on self. This
# will return the class that self belongs to. In this case, self will refer to 
# the object that is calling the method, which could be either Car or Truck, 
# since both mix in the Speed module.
# Since string interpolation is used, to_s will automatically be called on the
# class that is returned and a string representation of the class name will be
# interpolated into the string.
