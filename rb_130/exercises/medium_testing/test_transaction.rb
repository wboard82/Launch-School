require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class TestTransaction < Minitest::Test
  def setup
    @trans1 = Transaction.new(15)
  end

  # Check LS solution for both of these:
  # It involves changing the Transaction#prompt_for_payment method to also
  # accept an output and defining another StringIO object here in the test method.
  # Then, we pass that to the method and assert equality back in the test.
  # I like this solution better, since MiniTest provides the assert_output

  def test_prompt_for_payment
    input = StringIO.new("20\n")
    output = <<~OUTPUT
      You owe $15.
      How much are you paying?
      OUTPUT
    assert_output(output) { @trans1.prompt_for_payment(input: input) }
    assert_equal(20, @trans1.amount_paid)
  end

  def test_prompt_for_payment_wrong_amount
    input = StringIO.new("10\n15\n")
    output = <<~OUTPUT
      You owe $15.
      How much are you paying?
      That is not the correct amount. Please make sure to pay the full cost.
      You owe $15.
      How much are you paying?
      OUTPUT
    assert_output(output) { @trans1.prompt_for_payment(input: input) }
    assert_equal(15, @trans1.amount_paid)
  end
end
