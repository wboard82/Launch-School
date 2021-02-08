class RomanNumeral
  ONES = { 1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX' }
  TENS = { 1 => 'X', 4 => 'XL', 5 => 'L', 9 => 'XC' }
  HUND = { 1 => 'C', 4 => 'CD', 5 => 'D', 9 => 'CM' }

  def initialize(number)
    @number = number
  end

  def to_roman
    digits = @number.digits
    numerals = digits.map.with_index do |digit, idx|
      digit_to_numeral(digit, 10 ** idx)
    end

    numerals.reverse.join('')
  end

  private

  def digit_to_numeral(digit, place)
    case place
    when 1    then convert_ones(digit)
    when 10   then convert_tens(digit)
    when 100  then convert_hundreds(digit)
    when 1000 then convert_thousands(digit)
    end
  end

  def convert(digit, lookup)
    case digit
    when (1..3) then lookup[1] * digit
    when 4 then lookup[4]
    when (5..8) then lookup[5] + lookup[1] * (digit - 5)
    when 9 then lookup[9]
    end

  end
  def convert_ones(digit)
    convert(digit, ONES)
  end

  def convert_tens(digit)
    convert(digit, TENS)
  end

  def convert_hundreds(digit)
    convert(digit, HUND)
  end

  def convert_thousands(digit)
    "M" * digit
  end
end



