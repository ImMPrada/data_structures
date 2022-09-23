module LinkedList
  class Double < Single
    attr_reader :head, :tail, :size

    def add(number)
      if empty?
        @head = Node.new(number)
        @tail = @head
      else
        current_tail = @tail
        current_tail.next_node = Node.new(number)
        @tail = current_tail.next_node
        @tail.prev_node = current_tail
      end
      update_size
      number
    end

    def add_at(index, number)
      return nil unless (0..@size).cover?(index)

      node_to_add = Node.new(number)

      return update_head(node_to_add) if index.zero?

      node_h = get_node_at(index - 1)
      node_i = node_h.next_node

      return add(number) if node_i.nil?

      node_to_add.next_node = node_i
      node_to_add.prev_node = node_h
      node_h.next_node = node_to_add
      node_i.prev_node = node_to_add
      update_size
      number
    end

    def remove(index)
      return nil unless (0...@size).cover?(index)

      return remove_head if index.zero?

      node_h = get_node_at(index - 1)
      node_i = node_h.next_node

      return remove_tail if node_i.next_node.nil?

      node_i.next_node.prev_node = node_h
      node_h.next_node = node_i.next_node

      update_size(:down)
      node_i.value
    end

    def remove_extremes(extreme)
      if @size == 1
        @head = nil
        @tail = nil
        @size = 0
        return nil
      end

      return remove_head if extreme == :head
      return remove_tail if extreme == :tail
    end

    private

    def remove_tail
      new_tail = @tail.prev_node
      new_tail.next_node = nil
      @tail = new_tail
      update_size(:down)
      @tail.value
    end
  end
end
