class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class StackEmptyError < MinilangError; end

class Minilang
  STACK_OPS = ['PRINT', 'PUSH', 'POP']
  MATH_OPS = { 'ADD' => :+, 'SUB' => :-, 'MULT' => :*, 'DIV' => :/, 'MOD' => :% }

  def initialize(program)
    @program = program.split
  end

  def eval
    @register = 0
    @stack = []
    program.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  attr_reader :register, :stack, :program

  def eval_token(token)
    if STACK_OPS.include?(token)
      send(token.downcase)
    elsif MATH_OPS.include?(token)
      math_op(MATH_OPS[token])
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def print
    puts register
  end

  def push
    stack.push(register)
  end

  def pop
    raise StackEmptyError, "Empty stack!" if stack.empty?
    @register = stack.pop
  end

  def math_op(operation)
    @register = register.send(operation, stack.pop)
  end
end
