require_relative 'linked_list'

class Queue
  def initialize
    @queue = LinkedList.new
  end

  def add(number)
    @queue.add(number)
  end

  def remove
    return -1 if @queue.empty?

    @queue.remove(0)
  end
end
