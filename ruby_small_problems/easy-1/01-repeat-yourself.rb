# write a method that takes two args: a string and an integer, and prints the
# string as many times as the integer indicates

def repeat_yourself(str, n)
  n.times do
    puts str
  end
end

repeat_yourself("hi", 4)
repeat_yourself("bye", 2)
