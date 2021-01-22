class FixedArray
  attr_reader :length

  def initialize(length)
    @length = length
    @array = Array.new(5)
  end

  def [](index)
    raise IndexError unless (-length...length).cover?(index)
    array[index]
  end

  def []=(index, value)
    raise IndexError unless (-length...length).cover?(index)
    array[index] = value
  end

  def to_a
    array.clone
  end

  def to_s
    array.to_s
  end

  private
  attr_reader :array
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5
puts

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
puts

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]
puts

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]
puts

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
puts

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'
puts

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
