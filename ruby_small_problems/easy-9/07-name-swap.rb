def my_swap_name(name)
  first, last = name.split
  "#{last}, #{first}"
end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
