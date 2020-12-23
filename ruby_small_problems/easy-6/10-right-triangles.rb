def triangle(side_length)
  1.upto(side_length) do |num|
    puts " " * (side_length - num) + "*" * num
  end
end

#study change orientation of triangle

triangle(5)
triangle(9)
