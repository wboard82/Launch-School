class Wallet
  def initialize(ones, fives = 0, tens = 0, twenties = 0)
    @bills = { 1 => ones, 5 => fives, 10 => tens, 20 => twenties }
  end

  def total
    @bills.inject(0) do |sum, (value, qty)|
      sum + value * qty
    end
  end

  def ==(other)
    total == other.total
  end
end

wallet1 = Wallet.new(5, 1, 1)
wallet2 = Wallet.new(0, 0, 0, 1)
p wallet1.total #=> 20
p wallet2.total #=> 20
p wallet1 == wallet2 #=> false
