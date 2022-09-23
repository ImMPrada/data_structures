class Stack
  attr_reader :min

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
    removed_value = @stack.remove(0)
    update_min_by_pop(removed_value)

    removed_value
  end

  def empty?
    @size.zero?
  end

  private

  def update_min_by_push(value)
    return @min = value if @min.nil?

    @min = value if value < @min
  end

  def update_min_by_pop(value)
    return @min = nil if @size.zero?

    @min = @stack.generate_array.min if value == @min
  end
end
