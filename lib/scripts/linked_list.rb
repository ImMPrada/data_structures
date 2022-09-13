class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def add(number)
    if @head.nil?
      @head = Node.new(number)
      @tail = @head
    else
      @tail.next_node = Node.new(number)
      @tail = @tail.next_node
    end
  end

  def get(index)
    get_node_at(index).value
  end

  private

  def get_node_at(index)
    current_node = @head
    (0...index).each { current_node = current_node.next_node }

    current_node
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
