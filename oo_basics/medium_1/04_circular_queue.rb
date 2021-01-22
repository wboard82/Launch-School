require 'pry'

class CircularQueue
  def initialize(size)
    @size = size
    @buffer = Array.new(size)
    @next_idx = 0
    @oldest = 0
  end

  def enqueue(object)
    @oldest = increment(next_idx) unless buffer[next_idx].nil?

    buffer[next_idx] = object
    @next_idx = increment(next_idx)
  end

  def dequeue
    object = buffer[oldest]
    buffer[oldest] = nil
    @oldest = increment(oldest) unless object.nil?
    object
  end

  private

  def increment(position)
    (position + 1) % size
  end

  attr_reader :oldest, :next_idx, :buffer, :size
end

# Further exploration
class CircularQueue
  def initialize(size)
    @size = size
    @buffer = []
  end

  def enqueue(object)
    buffer.pop if buffer.size == size
    buffer.unshift(object)
  end

  def dequeue
    buffer.pop
  end

  private

  attr_reader :size, :buffer
end
=end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
