# ask for two numbers
# ask for operation
# display result

# nil -> Integer
# repeatedly prompts use for input until a valid number is input
#

def get_num
  num = nil

  loop do
    puts "Please enter a number:"
    input = gets.chomp
    if input == '0'
      num = 0
      break
    else
      num = input.to_i
      break unless num == 0
    end
    puts "Invalid number. Please try again."
  end

  num
end

ans = nil

loop do
  num1 = get_num
  num2 = get_num

  puts "What operation? (a = add, s = subtract, m = multiply, d = divide)"
  op = gets.chomp
  case op.downcase
  when 'a'
    ans = num1 + num2
    break
  when 's'
    ans = num1 - num2
    break
  when 'm'
    ans = num1 * num2
    break
  when 'd'
    if num2 == 0
      puts "Cannot divide by 0. Please try again."
    else
      ans = num1.to_f / num2.to_f
      break
    end
  else
    puts "Invalid operation #{op}. Please try again and enter: a, s, m, or d"
  end
end

puts "Answer: #{ans}"
