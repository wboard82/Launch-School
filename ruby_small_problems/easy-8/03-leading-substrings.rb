def leading_substrings(string)
  end_index = 0
  result = []
  loop do
    break if end_index == string.size
    result << string[0..end_index]
    end_index += 1
  end
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
