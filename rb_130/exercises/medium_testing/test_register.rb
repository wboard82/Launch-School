require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class TestCashRegister < Minitest::Test
  def setup
    @register = CashRegister.new(20.0)
    @trans1 = Transaction.new(6.0)
    @trans1.amount_paid = 6.0
    @trans2 = Transaction.new(18.50)
    @trans2.amount_paid = 20.0
  end

  def test_accept_money
    pre_amount = @register.total_money
    @register.accept_money(@trans1)
    post_amount = @register.total_money
    assert_in_delta(pre_amount + @trans1.amount_paid, post_amount)
  end

  def test_change
    assert_in_delta(0, @register.change(@trans1))
    assert_in_delta(1.50, @register.change(@trans2))
  end

  def test_give_receipt
    assert_output("You've paid $6.0.\n") { @register.give_receipt(@trans1) }
    assert_output("You've paid $18.5.\n") { @register.give_receipt(@trans2) }
  end

end
