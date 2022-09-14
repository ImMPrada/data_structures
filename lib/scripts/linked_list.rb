class LinkedList
  attr_accessor :head, :tail

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

  def add_at(index, number)
    node_to_add = Node.new(number)

    if index.zero?
      node_to_add.next_node = @head
      @head = node_to_add
      return
    end

    node_h = get_node_at(index - 1)
    node_i = get_node_at(index)

    return if node_h.nil? && node_i.nil?

    if node_i.nil?
      @tail.next_node = node_to_add
      @tail = node_to_add
      return
    end

    node_to_add.next_node = node_i
    node_h.next_node = node_to_add
  end

  def remove(index)
    if index.zero?
      node_to_remove = @head
      @head = node_to_remove.next_node
      return
    end
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
