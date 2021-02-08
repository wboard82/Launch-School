# From Quiz 2 #

* Running the following code will _not_ produce the output shown on the last
  line. Why not? What would you need to change?
    ```ruby
    class Student
      attr_accessor :grade

      def initialize(name, grade=nil)
        @name = name
      end 
    end

    ade = Student.new('Adewale')
    ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
    ```
  - The @grade instance variable will not show up at all when we inspect the
    object referenced by `ade`. This is because it is never initialized. In the
    `initialize` method, the parameter `grade` is given a default value of
    `nil`. Within the `initialize` method `grade` is only ever a local variable.
  - We never assign an instance variable `@grade` to the object referenced by
    `grade`.
  - To change this we would need to add a line in `initialize`:
    `@grade = grade`
  - This initializes the instance variable `@grade` to whatever the object
    referenced by the `grade` parameter. In the case of `ade` it will be `nil`.
  - Even though we have defined a getter method for `grade`, this does not mean
    that the variable is initialized. And, in Ruby, accessing an uninitialized
    instance variable returns `nil`. This makes it look like our `initialize`
    method with the default value for `grade` has worked. But it really hasn't.
    We are just getting the default `nil` that comes from attempting to access
    any uninitialized instance variable.
    
* What is a collaborator object? Give an example in code as part of your
  explanation.
    - An collaborator object is one that is used as part of another object's
    state. Phrased another way, if an object has an instance variable that
    points to a second object, that second object is a collaborator object for
    the first object. Although technically this could be any object including
    things like String, Integer, or Array objects, we are usually talking about
    custom objects when we refer to collaborator objects.
    ```ruby
    class Book
      attr_reader :title, :author
      
      def initialize(title, author)
        @title = title.capitalize
        @author = author.capitalize
      end
      
      def to_s
        "#{title} by #{author}"
      end
    end
    
    class Reader
      attr_reader :name, :fav_book
      
      def initialize(name, fav_book)
        @name = name
        @fav_book = fav_book
      end
      
      def talk_about_book
        puts "Hi! My name is #{name} and my favorite book is #{fav_book}."
      end
    end
    
    harry_potter = Book.new("Harry Potter", "J.K. Rowling")
    liz = Reader.new("Liz", harry_potter)
    liz.talk_about_book
    ```
    - In this example the `Book` object we create is passed as an argument to
      the `Reader.new` method where it is then passed to `initialize` and the
      instance variable `fav_book` is assigned to this object. That object is
      now a collaborator object for our `Reader` object `liz`.
    - The `Book` object is part of the state of `liz` as it is assigned to an
      instance variable. We implicitly call `Book#to_s` from within the
      `Reader#talk_about_book` method when we interpolate `fav_book` into a
      string.
    
* What are the differences between classes and modules? (give at least 3)
    - Classes can inherit from superclasses or be superclass of their own
      subclasses. Modules cannot inherit or be inherited from.
    - Modules can be mixed into multiple unrelated classes. Classes can only
      inherit from one superclass. However, they can include many modules.
    - 
* When would you want to use class inheritance vs. a mixin? Give an example in
  code.
    - You may want to use class inheritance when dealing with a problem domain
      that lends itself to a hierarchical model. When you can describe a
      relationship as 'X *is a* Y' then X should inherit from Y. For instance, a
      mammal *is an* animal. In this case I would create an Animal class and
      have the Mammal class inherit from Animal.
    - If the relationship is a 'has a' relationship, this is more likely going
      to be a good fit to use a module. For instance, let's say both Mouse and
      Bird inherit from Animal (possibly with other classes in between). Both of
      these animals make nests, but not all animals do. So we could create a
      module `Nestable` with methods defining nesting behavior. This could be
      included in both of these classes. A bird *has a* nest and a mouse *has a*
      nest.

* You're designing a Recipe Book application.
    - You've identified some classes that you need:
        * RecipeBook
        * Recipe
        * StarterRecipe
        * MainCourseRecipe
        * DessertRecipe
        * Ingredient
    - Each Recipe Book has one or more recipes.
    - Starter recipes, main course recipes, and dessert recipes are all recipe types and share some
    characteristics but not others.
    - Recipes have one or more ingredients.
    - You decide that the application also needs a Conversion module that contains some temperature
        and measurement conversion methods required by Recipe and Ingredient objects. 
    - Describe the relationships between the classes you've identified (are they sub/super classes?, 
      are they modules?, are they collaborators?)
    - Write a skeleton of the class structure in code.
