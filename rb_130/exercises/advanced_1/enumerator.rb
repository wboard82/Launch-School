factorial = Enumerator.new do |y|
  fact = 1
  next_num = 1

  loop do
    y << fact

    fact *= next_num
    next_num += 1
  end
end

7.times do
  p factorial.next
end

factorial.rewind

7.times do
  p factorial.next
end

3.times do
  p factorial.next
end
