# Implement a stack machine language
#
# n - any number, place in the register
# PUSH - push the register onto the stack
# ADD/SUB/MULT/DIV/MOD - pops from stack, performs op with that and register
# val, result goes on register
# POP - pop from stack onto register
# PRINT - prints regsiter
#

def minilang(program)
  register = 0
  stack = []
  instructions = program.split

  instructions.each do |instruction|
    case instruction
    when "PRINT" then puts register
    when "PUSH" then stack.push(register)
    when "POP"
      if stack.empty?
        raise "Error: empty stack!"
      end
      register = stack.pop
    when "ADD" then register += stack.pop || (raise "Error: empty stack!")
    when "SUB" then register -= stack.pop || (raise "Error: empty stack!")
    when "MULT" then register *= stack.pop || (raise "Error: empty stack!")
    when "DIV" then register /= stack.pop || (raise "Error: empty stack!")
    when "MOD" then register %= stack.pop || (raise "Error: empty stack!")
    else
      if instruction != instruction.to_i.to_s
        raise "Error: invalid token, #{instruction}!"
      end
      register = instruction.to_i
    end
  end
  nil
end

# (3 + (4 * 5) - 7) / (5 % 3)
# ((3 (4 5 *) +) 7 -) (5 3 %) /)
minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')
puts 

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
