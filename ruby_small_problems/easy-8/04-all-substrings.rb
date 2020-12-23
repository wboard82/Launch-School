def leading_substrings(string)
  end_index = 0
  result = []
  loop do
    break if end_index >= string.size
    result << string[0..end_index]
    end_index += 1
  end
  result
end

def substrings(string)
  begin_index = 0
  result = []
  loop do
    break if begin_index >= string.size
    result += leading_substrings(string[begin_index..-1])
    begin_index += 1
  end

  result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
