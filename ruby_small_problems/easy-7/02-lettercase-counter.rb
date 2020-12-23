=begin
PROBLEM:
 - String -> Hash
 - String can be any string
 - Hash has 3 entries: lowercase, uppercase, and neither, each representing
   the corresponding number of characters in the string.

DATA: String, hash, likely array in between

ALGORITHM:
- Initialize hash, 'case_counts' to have 3 given keys with value of 0
- For each character in parameter 'string', test:
  - Is it uppercase? -> increment :uppercase key
  - Is it lowercase? -> increment :lowercase key
  - Else -> increment :neither key
- Return the hash
=end
UPPERS = [*'A'..'Z']
LOWERS = [*'a'..'z']

def letter_case_count1(string)
  case_counts = {uppercase: 0, lowercase: 0, neither: 0}

  string.each_char do |char|
    if UPPERS.include?(char)
      case_counts[:uppercase] += 1
    elsif LOWERS.include?(char)
      case_counts[:lowercase] += 1
    else
      case_counts[:neither] += 1
    end
  end

  case_counts
end


def letter_case_count2(string)
  case_counts = {uppercase: 0, lowercase: 0, neither: 0}

  string.each_char do |char|
    if ('A'..'Z').cover?(char)
      case_counts[:uppercase] += 1
    elsif ('a'..'z').cover?(char)
      case_counts[:lowercase] += 1
    else
      case_counts[:neither] += 1
    end
  end

  case_counts
end

#study - this given answer using Regex
def letter_case_count(string)
  case_counts = {}
  characters = string.chars

  case_counts[:uppercase] = characters.count {|char| char =~ /[A-Z]/}
  case_counts[:lowercase] = characters.count {|char| char =~ /[a-z]/}
  case_counts[:neither] = characters.count {|char| char =~ /[^A-Za-z]/}

  case_counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
