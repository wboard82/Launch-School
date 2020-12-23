def center_of(string)
  middle_l = (string.size - 1) / 2
  middle_r = string.size / 2
  string[middle_l..middle_r]
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
