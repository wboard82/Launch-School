count = 1

loop do
  puts "#{count} is #{count.even? ? 'even' : 'odd'}!"
  break if count == 5
  count += 1
end
