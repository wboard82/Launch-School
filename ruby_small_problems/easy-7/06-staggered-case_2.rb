def staggered_case(string, first_upper: true, non_alpha: false)
  need_upper = first_upper
  result = ''
  string.each_char do |char|
    if !non_alpha && char.match?(/[^A-Za-z]/)
      result << char
      next
    elsif need_upper
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end

  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('I Love Launch School!', non_alpha: true) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', non_alpha: true) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', non_alpha: true) == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('I Love Launch School!', non_alpha: true, first_upper: false) == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', non_alpha: true, first_upper: false) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers', non_alpha: true, first_upper: false) == 'iGnOrE 77 tHe 444 nUmBeRs'
