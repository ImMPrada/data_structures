class Stack
  def initialize
    @stack = LinkedList::SingleLinkedList.new
    @size = 0
  end

  def push(value)
    @size += 1
    @stack.add_at(0, value)
  end

  def pop
    @size -= 1
    @stack.remove(0)
  end

  def empty?
    @size.zero?
  end
end
