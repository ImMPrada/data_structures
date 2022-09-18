class Stack
  def initialize
    @stack = LinkedList::SingleLinkedList.new
    @size = 0
    @min = nil
  end

  def push(value)
    @size += 1
    @stack.add_at(0, value)
    update_min_by_push(value)
  end

  def pop
    @size -= 1
    @stack.remove(0)
  end

  def empty?
    @size.zero?
  end

  private

  def update_min_by_push(value)
    return @min = value if @min.nil?

    @min = value if value < @min
  end
end
