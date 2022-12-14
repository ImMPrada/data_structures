module LinkedList
  class Single
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
      return nil unless (0..@size).cover?(index)

      node_to_add = Node.new(number)

      return update_head(node_to_add) if index.zero?

      node_h = get_node_at(index - 1)
      node_i = node_h.next_node

      return add(number) if node_i.nil?

      node_to_add.next_node = node_i
      node_h.next_node = node_to_add
      update_size
      number
    end

    def remove(index)
      return nil unless (0...@size).cover?(index)

      return remove_head if index.zero?

      node_h = get_node_at(index - 1)
      node_i = node_h.next_node

      return remove_tail(index) if node_i.next_node.nil?

      node_h.next_node = node_i.next_node
      update_size(:down)
      node_i.value
    end

    def generate_array
      build_array
    end

    def to_s
      "Linkedlist transformed to an array: #{build_array}"
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
      node_to_remove.value
    end

    def remove_tail(index)
      new_tail = get_node_at(index - 1)
      new_tail.next_node = nil
      @tail = new_tail
      update_size(:down)
      @tail.value
    end

    def build_array
      return [] if empty?

      array = []
      current_node = @head

      until current_node.nil?
        array << current_node.value
        current_node = current_node.next_node
      end

      array
    end
  end
end
