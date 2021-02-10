require 'pry'

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(num, next_elem = nil)
    @datum = num
    @next = next_elem
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  def self.from_a(arr)
    list = new

    arr&.reverse_each do |num|
      list.push(num)
    end

    list
  end

  def empty?
    size == 0
  end

  def push(num)
    @head = Element.new(num, @head)
    @size += 1
  end

  def peek
    @head&.datum
  end

  def pop
    if size > 0
      element = @head
      @head = @head.next
      @size -= 1
    end

    element.datum
  end

  def to_a
    arr = []
    ptr = @head
    until ptr.nil?
      arr << ptr.datum
      ptr = ptr.next
    end
    arr
  end

  def reverse
    next_elem = @head
    last_elem = nil

    until next_elem.nil?
      @head = next_elem
      next_elem = next_elem.next
      @head.next = last_elem
      last_elem = @head
    end
    self
  end
end
