# loan_calc.rb
# mortage/loan calculator
# takes 1) loan amount 2) APR 3) loan duration
# returns monthly payment, total amount payed, and total interest

require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

def clear
  system('clear') || system('cls')
end

def calc_monthly_payment(principal, apr, months)
  if apr == 0.0
    principal.to_f / months
  else
    monthly_rate = apr / 12
    principal * (monthly_rate / (1 - (1 + monthly_rate)**(-months)))
  end
end

def prompt(message)
  Kernel.puts("=> #{MESSAGES[message]}")
end

def affirmative?(input)
  input.downcase == 'y' || input.downcase == 'yes'
end

def valid_float?(input)
  Float(input) rescue false
end

def valid_int?(input)
  Integer(input) rescue false
end

def get_principal
  loop do
    input = gets.chomp.tr('$,', '')
    if valid_float?(input) && (input.to_f > 0)
      return input.to_f
    else
      prompt('reprompt_principal')
    end
  end
end

def get_apr
  loop do
    input = gets.chomp.tr('%', '')
    if valid_float?(input) && (input.to_f >= 0)
      return (input.to_f * 0.01)
    else
      prompt('reprompt_apr')
    end
  end
end

def get_term
  loop do
    input = gets.chomp
    if valid_int?(input) && (input.to_i > 0)
      return (input.to_i)
    else
      prompt('reprompt_term')
    end
  end
end

# Main loop
loop do
  clear

  puts MESSAGES['welcome']

  prompt('principal_prompt')
  principal = get_principal

  prompt('apr_prompt')
  apr = get_apr

  prompt('term_prompt')
  term = get_term

  monthly_payment = calc_monthly_payment(principal, apr, term)
  total_payed = monthly_payment * term
  total_interest = total_payed - principal

  clear

  print format(MESSAGES['results'],
               term: term,
               principal: format('%.0f', principal),
               apr: (apr * 100).round(3))
  puts '%:'

  puts MESSAGES['monthly_payment'] + format('%.2f', monthly_payment)
  puts MESSAGES['total_payed'] + format('%.2f', total_payed)
  puts MESSAGES['total_interest'] + format('%.2f', total_interest)

  puts
  prompt('another')
  answer = Kernel.gets().chomp()
  break unless affirmative?(answer)
end

puts ''
prompt('goodbye')
