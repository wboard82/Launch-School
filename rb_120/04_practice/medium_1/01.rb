class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben is correct here. On `line 2` a getter method is defined with
# `attr_reader`. This means that `line 9` is a method call to the `balance`
# getter method. `line 9` almost looks like it is an assignment because of the
# `=` in `>=`, but it is really a comparison method, meaning that `balance` is a
# getter call.
