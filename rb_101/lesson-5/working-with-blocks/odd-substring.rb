def solve(string)
  total_odd_subs = 0
  string.chars.each_with_index do |char, index|
    if char.to_i.odd?
      total_odd_subs += index + 1
    end
  end

  total_odd_subs
end



p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
