class Queue
  def initialize
    @queue = LinkedList::Single.new
  end

  def add(number)
    @queue.add(number)
  end

  def remove
    return -1 if @queue.empty?

    @queue.remove(0)
  end

  def empty?
    @queue.empty?
  end
end
