class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(e)
    @queue.unshift(e)
  end

  def dequeue
    @queue.pop
  end
end