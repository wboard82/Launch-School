require './loan_calc.rb'

def test(test, test_name)
  p test || "#{test_name} failed"
end

test(calc_monthly_payment(100_000, 0.06, 120).round(2) == 1110.21, "monthly payment test 1")
test(calc_monthly_payment(100_000, 0.0, 120).round(2) == 833.33, "monthly payment test 2")
test(calc_monthly_payment(10_000, 0.05, 6).round(2) == 1691.06, "monthly payment test 3")

=begin
puts("Enter 10000")
test(get_principal == 10000.0, "get_principal1")
puts("Enter 10,000")
test(get_principal == 10000.0, "get_principal2")
puts("Enter $.20")
test(get_principal == 0.20, "get_principal3")
puts("Enter $1,000")
test(get_principal == 1000, "get_principal4")

puts("Enter 5.5")
test(get_apr == 0.055, "get_apr1")
puts("Enter 5.5%")
test(get_apr == 0.055, "get_apr2")
puts("Enter 0")
test(get_apr == 0, "get_apr3")
puts("Enter -5, then 1")
test(get_apr == 0.01, "get_apr4")
puts("Enter 'hello', then .5")
test(get_apr == 0.005, "get_apr5")
=end

puts("Enter 1")
test(get_term == 1, "get_term1")
puts("Enter 60")
test(get_term == 60, "get_term2")
puts("Enter 'hello', then 0, then 12")
test(get_term == 12, "get_term3")


