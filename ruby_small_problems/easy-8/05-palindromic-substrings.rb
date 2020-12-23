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

def palindromes(string)
  palindrome_subs = []
  substrings = substrings(string)

  substrings.each do |sub|
    if sub.size > 1 && sub == sub.reverse
      palindrome_subs << sub
    end
  end

  palindrome_subs
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

#study - do further exploration
