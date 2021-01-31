## Explain why Object Oriented Programming was created. Give at least three examples of problems OO solves. ##

Object oriented programming came about from the need to better organize and
compartmentalize code as programs grew larger and larger. As software grew,
programs often got tangled up in a web of dependencies. This made extending
functionality, fixing bugs, and reasoning about the code more and more difficult
as the code base became larger and larger.

OO Programming is a solution to this problem that allows programmers to think
about code in distinct units such as objects, classes, and modules. Ideally,
these units hide much of the implementation from other parts of code and
interact with those parts through a limited set of methods or an interface. When
this works well, making changes no longer ripples across the entire code base.
Often, a change can be limited in scope to a single module or class.

Another problem this addresses is that it allows better reuse of code since the
code is already organized into distinct units that can be used in a variety of
programs once it is written.

Finally, OO design allows programmers to think at a higher level of abstraction.
Rather than thinking about how an object is implemented, they can simply think
about how to use that object. Hiding the implementation complexities behind an
interface can allow programmers to think at a higher level of abstraction.

## Describe the relationship between an object and its class ##

A class can be thought of as a plan or mold for an object. In the class
definition, we lay out the the behavior and attributes that objects will have.
However, the class does not have these behaviors and attributes itself -- the
objects do. So, the `Person` class might specify that each instance of the class
will have a `name` and `age` as attributes and has behaviors (methods) such as
`walk` and `talk`. But these attributes and behaviors are not realized until an
object is instantiated from that class.
```ruby
class Person
  attr_accessor :name, :age
  
  def initialize(name, age)
    @age = age
    @name = name
  end
  
  def talk(what_to_say)
    puts what_to_say
  end
  
  def walk
    puts "#{name} is walking."
  end
end

# jane is an object and has these behaviors specified by the Person class
jane = Person.new("Jane", 37)
jane.talk("Hello!") 
jane.walk

# Technically these are methods (behaviors) as well, although they function
# simply to expose the attributes of an object to the outside
jane.name
jane.age

Person.walk # this will create an error because the class cannot walk, only objects of the class can do this
```

##Describe how modules are different from classes## 

Modules are different from classes in a few fundamental ways:
* Objects can be instantiated from a class, but not from a module.
* Classes can inherit from superclasses, but modules are not subject to
  inheritance
* A class can mix in multiple modules and a module can be mixed into multiple
  classes. However, a class can only inherit from a single super-class. (Although
  a single class can be a super class to multiple sub-classes.)
* 

Why is encapsulation used in writing programs? What benefits does it give?


How does inheritance help make code more flexible and reusable?


What does inheritance mean in the context of a Ruby class definition?


Describe the different ways that polymorphism can be achieved in a Ruby program?


What is polymorphism?
