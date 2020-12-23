def print_edge(width)
  puts '+' + ('-' * width) + '+'
end

def print_margin(width)
  puts '|' + (' ' * width) + '|'
end

def print_in_box(string)
  banner_width = string.length + 2
  print_edge(banner_width)
  print_margin(banner_width)
  puts '| ' + string + ' |'
  print_margin(banner_width)
  print_edge(banner_width)
end


print_in_box('To boldly go where no one has gone before.')
print_in_box('')

#study - Further exploration
