class Octal
  def initialize(num_string)
    @num_string = num_string
  end

  def to_decimal
    exp = 0
    sum = 0

    @num_string.reverse.each_char do |digit|
      return 0 unless ('0'..'7').cover?(digit)
      sum += (digit.to_i * (8 ** exp))
      exp += 1
    end

    sum
  end
end
