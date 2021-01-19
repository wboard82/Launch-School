require 'io/console'

puts "This is a test:"
print "Press any key to continue:"
STDIN.getch
print "\e[G\e[K"
puts "More of a test"
