# Why is it generally safer to invoke a setter method (if available) vs. referencing
# the instance variable directly when trying to set an instance variable within the class?
# Give an example.

# Give an example of when it would make sense to manually write a custom getter
# method vs. using `attr_reader`.

=begin
If a class defines a getter/setter through attr_* or a very basic method definition,
there is little difference within the class between accessing the variable directly or through
the getter/setter. However, in some cases, extra protections might be implemented within
a getter/setter method.
For instance, let's say we have a `Date` class:
```
class Date
  def initialize(year, month, day)
    self.year = year
    self.month = month
    self.day = day
  end

  def month=(month)
    raise InvalidDateError unless valid_month?(month)
    @month = month
  end

  def day=(day)
    raise InvalidDateError unless valid_day?(day)
    @day = day
  end

  def year=(year)
    raise InvalidDateError unless valid_year?(year)
    @year = year
  end
end
```

Here we have setter methods that perform validation of the inputs for each instance variable.
If instead of using the setter methods I did this:
```
def initialize(year, month, day)
  @year = year
  @month = month
  @day = day
end
```

I could create an invalid new date like: `Date.new(-12, 65, 134)`

In another example I could want a custome getter method if I wanted to perform some
processing on an instance variable when it is accessed from outside (or even inside) the class.

A good example would be if I am storing an credit card number and only want to expose the last
four digits:
```
class Customer
  def initialize(name, card_num)
    @name = name
    @card_num = card_num.to_s
  end

  def card_num
    "Card ending in #{@card_num[-1, 4]}"
  end
end
```

=end
