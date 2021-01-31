class SecretNumber
  def initialize
    new_secret_num
  end

  def >(other)
    num > other.num
  end

  def reset
    new_secret_num
  end

  protected
  attr_reader :num

  private
  def new_secret_num
    @num = rand(10)
  end
end

num1 = SecretNumber.new
num2 = SecretNumber.new
5.times do
  if num1 > num2
    puts "Num1 is bigger!"
  elsif num2 > num1
    puts "Num2 is bigger!"
  else puts "They're equal."
  end
  puts "--- Resetting numbers ---"
  num1.reset
  num2.reset
end

num1.num    # => error - trying to access private method
