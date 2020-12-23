require 'date'

def friday_13th(year)
  unlucky_total = 0
  1.upto(12) do |month|
    if Date.new(year, month, 13).friday?
      unlucky_total += 1
    end
  end

  unlucky_total
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

#study further exploration - number of months with 5 fridays


