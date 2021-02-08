class Triangle
  def initialize(a, b, c)
    @sides = [a, b, c].sort
    error = check_sides
    raise(ArgumentError, error) if error
  end

  def kind
    if longest_sides_equal?
      if shortest_side_equal_to_others?
        "equilateral"
      else
        "isosceles"
      end
    else
      "scalene"
    end
  end

  private

  def check_sides
    if @sides.any? { |side| side < 0 }
      "Invalide side lingths: all sides must be positive numbers"
    elsif @sides[2] >= @sides[0] + @sides[1]
      "Invalid side lengths: short sides less than or equal to long side"
    end
  end

  def longest_sides_equal?
    @sides[1] == @sides[2]
  end

  def shortest_side_equal_to_others?
    @sides[0] == @sides[1]
  end
end
