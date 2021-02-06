# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects." unless todo.instance_of?(Todo)

    @todos << todo
    self
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |item| item.done? }
  end

  #!!! should this raise its own exceptions?
  def item_at(idx)
    raise IndexError if idx >= @todos.size
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    raise IndexError if idx >= @todos.size
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    raise IndexError if idx >= @todos.size
    item_at(idx).undone!
  end

  def done!
    @todos.each { |item| item.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    raise IndexError if idx >= @todos.size
    @todos.delete_at(idx)
  end

  def to_s
    result = "---- #{title} ----"
    @todos.each do |item|
      result << "\n#{item}"
    end

    result
  end

  def each
    @todos.each { |item| yield item }
    self
  end

  def select
    result = TodoList.new(title)

    self.each { |item| result.add(item) if yield(item) }

    result
  end

  def find_by_title(target_title)
    each { |todo| return todo if todo.title == target_title }

    nil
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(target_title)
    find_by_title(target_title)&.done!
  end

  def mark_all_done
    #mark every todo as done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    #mark every todo as not done
    each do |todo|
      todo.undone!
    end
  end
end
