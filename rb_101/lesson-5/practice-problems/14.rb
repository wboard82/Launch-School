# Hash -> Array
# - Colors of the fruit and sizes of the vegetables
# - Colors
# - SIZES

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = hsh.map do |name, info|
  if info[:type] == 'fruit'
    info[:colors].map(&:capitalize)
  else
    info[:size].upcase
  end
end

p arr
