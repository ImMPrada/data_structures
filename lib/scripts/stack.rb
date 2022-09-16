require_relative 'linked_list'

class Stack
  def initialize
    @stack = LinkedList.new
  end

  def push(value)
    @stack.add_at(0, value)
  end

  def pop
    @stack.remove(0)
  end
end
