class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def empty?
    @size.zero?
  end

  def add(number)
    if empty?
      @head = Node.new(number)
      @tail = @head
    else
      @tail.next_node = Node.new(number)
      @tail = @tail.next_node
    end
    update_size
    number
  end

  def get(index)
    node_found = get_node_at(index)

    node_found.nil? ? nil : node_found.value
  end

  def add_at(index, number)
    return nil if index > @size

    node_to_add = Node.new(number)

    return update_head(node_to_add) if index.zero?

    node_h = get_node_at(index - 1)
    node_i = get_node_at(index)

    return add(number) if node_i.nil?

    node_to_add.next_node = node_i
    node_h.next_node = node_to_add
    update_size
    number
  end

  def remove(index)
    return remove_head if index.zero?

    node_i = get_node_at(index)

    return remove_tail(index) if node_i.next_node.nil?

    node_h = get_node_at(index - 1)
    node_h.next_node = node_i.next_node
    update_size(:down)
  end

  private

  def get_node_at(index)
    return nil if empty? || !(0...@size).cover?(index)

    current_node = @head
    (0...index).each { current_node = current_node.next_node }

    current_node
  end

  def update_size(move = :up)
    move == :down ? @size -= 1 : @size += 1
  end

  def update_head(node_to_add)
    node_to_add.next_node = @head
    @head = node_to_add
    update_size
  end

  def remove_head
    node_to_remove = @head
    @head = node_to_remove.next_node
    update_size(:down)
  end

  def remove_tail(index)
    new_tail = get_node_at(index - 1)
    new_tail.next_node = nil
    @tail = new_tail
    update_size(:down)
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
