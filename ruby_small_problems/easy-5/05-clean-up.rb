def cleanup(string)
  string.gsub!(/[^a-z]+/, ' ')
end

def cleanup(string)
  put_space = true
  output_string = ""
  string.each_char do |char|
    if char.match?(/[a-z]/)
      put_space = true
      output_string << char
    elsif put_space
      output_string << ' '
      put_space = false
    end
  end

  output_string
end

puts cleanup("---what's my +*& line?") == ' what s my line '
