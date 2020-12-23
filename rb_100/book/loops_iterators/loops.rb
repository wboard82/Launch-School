
loop do
  puts "Do you want to do that again?"
  answer = gets.chomp

  if (answer != 'Y') && (answer != 'y')
    break
  end
end
