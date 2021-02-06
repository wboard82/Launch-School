def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'


def compute_with_arg(num)
  if block_given?
    yield num
  else
    "Does not compute."
  end
end

p compute_with_arg(5) { |num| num + 3 } == 8
p compute_with_arg('a') { |char| char + 'b' } == 'ab'
p compute_with_arg(4) == 'Does not compute.'
