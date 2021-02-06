require './todo.rb'
# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----
# size
puts list.size == 3                       # returns 3


# first
puts list.first == todo1                      # returns todo1, which is the first item in the list

# last
puts list.last == todo3                      # returns todo3, which is the last item in the list

#to_a
puts list.to_a == [todo1, todo2, todo3]                     # returns an array of all items in the list

#done?
puts list.done? == false                    # returns true if all todos in the list are done, otherwise false

puts "---- Retrieving an item in the list ----"

# item_at
# list.item_at                    # raises ArgumentError
puts list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

puts "---- Marking items in the list -----"

# mark_done_at
#list.mark_done_at               # raises ArgumentError
puts list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

# mark_undone_at
#list.mark_undone_at             # raises ArgumentError
puts list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError

# done!
puts list.done!                      # marks all items as done

puts "---- Deleting from the list ----"

# shift
#puts list.shift                      # removes and returns the first item in list

# pop
#puts list.pop                        # removes and returns the last item in list

# remove_at
# list.remove_at                  # raises ArgumentError
puts list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError


puts "---- Outputting the list -----"

# to_s
puts list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
