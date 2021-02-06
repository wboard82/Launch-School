require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    returned_value = @list.shift
    assert_equal(@todo1, returned_value)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    returned_value = @list.pop
    assert_equal(@todo3, returned_value)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @list.mark_all_done
    assert(@list.done?)
  end

  def test_add_raises_error
    assert_raises(TypeError){ @list.add("Do the laundry!") }
    assert_raises(TypeError){ @list.add(5) }
  end

  def test_shovel_operator
    new_todo = Todo.new("Do the laundry!")
    @list << new_todo
    assert_equal(new_todo, @list.last)
  end

  def test_add
    new_todo = Todo.new("Do the laundry!")
    @list.add(new_todo)
    assert_equal(new_todo, @list.last)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(@list.size) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(@list.size) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(@list.size) }

    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_all_done
    none_done = @list.all_done
    assert_equal(0, none_done.size)

    @list.mark_done_at(1)
    one_done = @list.all_done
    assert_equal(1, one_done.size)
    assert_same(@todo2, one_done.first)
  end

  def test_all_not_done
    all_not_done = @list.all_not_done
    assert_equal(@todos, all_not_done.to_a)

    @list.mark_done_at(1)
    two_not_done = @list.all_not_done
    assert_equal(2, two_not_done.size)
    assert_equal([@todo1, @todo3], two_not_done.to_a)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(@list.size) }
    assert_same(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_find_by_title
    assert_same(@todo1, @list.find_by_title("Buy milk"))
    assert_same(@todo3, @list.find_by_title("Go to gym"))
    assert_nil(@list.find_by_title("Nothing"))
  end

  def test_to_s_empty_list
    output = "---- Today's Todos ----"

    3.times { |idx| @list.remove_at(0) }
    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [X] Go to gym
    OUTPUT
    @list.mark_done_at(2)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result_arr = []
    @list.each { |item| result_arr << item }
    assert_equal(@todos, result_arr)
  end

  def test_each_returns_original_object
    assert_same(@list, @list.each { |item| item.done? })
  end

  def test_select_creates_empty_list
    result_list = @list.select { |item| item.done? }
    assert_equal(0, result_list.size)
  end

  def test_mark_done_by_title
    @list.mark_done("Buy milk")
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_select_creates_new_list_not_empty
    @list.mark_done_at(1)
    result_list = @list.select { |item| item.done? }
    refute_same(result_list, @list)
    assert_same(result_list.first, @todo2)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
end
