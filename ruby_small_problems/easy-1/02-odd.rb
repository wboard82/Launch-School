def is_odd?(num)
  num % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
puts "------------------------"

def is_odd_r?(num)
  num.remainder(2).abs == 1
end

puts is_odd_r?(2)    # => false
puts is_odd_r?(5)    # => true
puts is_odd_r?(-17)  # => true
puts is_odd_r?(-8)   # => false
puts is_odd_r?(0)    # => false
puts is_odd_r?(7)    # => true
puts "------------------------"

def is_odd2?(num)
  def helper(num, parity)
    if num == 0
      parity == 1
    else
      helper(num - 1, (parity + 1) % 2)
    end
  end
  helper(num.abs, 0)
end

puts is_odd2?(2)    # => false
puts is_odd2?(5)    # => true
puts is_odd2?(-17)  # => true
puts is_odd2?(-8)   # => false
puts is_odd2?(0)    # => false
puts is_odd2?(7)    # => true
