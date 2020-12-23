# What does the following code output?

# B, L, D Pt 1
def meal
  return 'Breakfast'
end

puts meal

# >> Breakfast


# B, L, D Pt 2
def meal
  'Evening'
end

puts meal

# >> Evening


#B, L, D Pt 3
def meal
  return 'Breakfast'
  'Dinner'
end

puts meal

# >> Breakfast


#B, L, D Pt 4
def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal

# >> Dinner
# >> Breakfast


#B, L, D Pt 5

def meal
  'Dinner'
  puts 'Dinner'
end

p meal

# >> Dinner
# >> Nil
# (prints Nil because of using 'p' and the return value of #puts
 
#B, L, D Pt 6

def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal

# >> Breakfast

# Sheep 1

def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

# 0 1 2 3 4 5
# 5 because the #times method returns the original value and that is last line in method


# Sheep 2

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

# >> 0 1 2 3 4 10


# Sheep 3

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

# >> 0 1 2 nil


# Tricky Number

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number

# >> 1
