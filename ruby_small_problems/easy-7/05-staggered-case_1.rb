def staggered_case(string, first_upper: true)
  need_upper = first_upper
  result = ''
  string.each_char do |char|
    if need_upper
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end

  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('I Love Launch School!', first_upper: false) == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', first_upper: false) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers', first_upper: false) == 'iGnOrE 77 tHe 444 nUmBeRs'
