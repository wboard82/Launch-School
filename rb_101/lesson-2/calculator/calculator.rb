require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  Integer(input, exception: false)
end

def valid_number?(input)
  integer?(input)
end

def operation_to_message(op)
  message = case op
            when '1'
              MESSAGES['adding']
            when '2'
              MESSAGES['subracting']
            when '3'
              MESSAGES['multiplying']
            when '4'
              MESSAGES['dividing']
            end

  message
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['hello'] + "#{name}!")

loop do
  number1 = ''
  number2 = ''

  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['number_error'])
    end
  end

  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['number_error'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator_error'])
    end
  end

  prompt(operation_to_message(operator) + ' ' + MESSAGES['calculating'])

  result = nil

  case operator
  when '1'
    result = number1.to_i() + number2.to_i()
  when '2'
    result = number1.to_i() - number2.to_i()
  when '3'
    result = number1.to_i() * number2.to_i()
  when '4'
    result = number1.to_f() / number2.to_f()
  end

  prompt(MESSAGES['result'] + result.to_s)

  prompt(MESSAGES['repeat_prompt'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])
