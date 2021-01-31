class Customer
  class InvalidCardNumError < RuntimeError; end

  def initialize(name, card_num)
    @name = name                # directly setting the instance variable
    self.card_num = card_num    # setting using a setter
  end

  def to_s
    "Customer #{@name}'s is using a #{card_num}."
  end

  # This getter method obscures all but the last four digits of the card number.
  # We should use this getter instead of referencing the raw variable directly
  def card_num
    "card ending in: #{@card_num[-4, 4]}"
  end

  # This setter ensures that the number we pass in is a valid card number (16
  # digits long in this example - although a real check would need more than this.)
  def card_num=(card_num)
    card_num = card_num.delete('-')
    raise InvalidCardNumError if card_num.size != 16
    @card_num = card_num
  end
end

cindy = Customer.new('Cindy', "4567-1234-5678-9999")
puts cindy
john = Customer.new('John', "1234") # => throws an error
