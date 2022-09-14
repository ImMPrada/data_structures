require './spec/spec_helper'

RSpec.describe LinkedList do
  describe 'class Node' do
    let(:node) { Node.new(1) }
    let(:another_node) { Node.new(2, node) }

    it 'returns a Node object' do
      expect(node).to be_a Node
    end

    describe 'when initialized with only a value' do
      it 'has a value' do
        expect(node.value).to eq 1
      end

      it 'has a nil next_node' do
        expect(node.next_node).to be_nil
      end
    end

    describe 'when initialized with a value and a next_node' do
      it 'has a value' do
        expect(another_node.value).to eq 2
      end

      it 'has a next_node' do
        expect(another_node.next_node).not_to be_nil
      end
    end
  end

  describe 'class LinkedList' do
    let(:linked_list) { described_class.new }

    it 'returns a LinkedList object' do
      expect(linked_list).to be_a described_class
    end

    it 'has nil head' do
      expect(linked_list.head).to be_nil
    end

    it 'has nil tail' do
      expect(linked_list.tail).to be_nil
    end

    describe '#add' do
      before do
        linked_list.add(1)
      end

      describe 'adds a node to the list' do
        it 'has a head' do
          expect(linked_list.head).not_to be_nil
        end

        it 'has a tail' do
          expect(linked_list.tail).not_to be_nil
        end
      end
    end

    describe '#get' do
      it 'returns the value of the node at the specified index' do
        linked_list.add(1)
        linked_list.add(2)
        expect(linked_list.get(1)).to eq 2
      end
    end

    describe '#add_at' do
      let(:new_head_value) { 11 }
      let(:new_middle_value) { 13 }
      let(:new_tail_value) { 25 }

      before do
        linked_list.add(5)
        linked_list.add(3)
        linked_list.add_at(0, new_head_value)
        linked_list.add_at(3, new_tail_value)
        linked_list.add_at(1, new_middle_value)
      end

      it 'updates head' do
        expect(linked_list.head.value).to be(new_head_value)
      end

      it 'updates a middle value' do
        expect(linked_list.get(1)).to be(new_middle_value)
      end

      it 'updates tail' do
        expect(linked_list.tail.value).to be(new_tail_value)
      end

      it 'updates size' do
        expect(linked_list.size).to be(5)
      end
    end

    describe '#remove' do
      before do
        linked_list.add(5)
        linked_list.add(3)
        linked_list.add(2)
        linked_list.add(1)
      end

      it 'removes the head' do
        linked_list.remove(0)
        expect(linked_list.head.value).to be(3)
      end

      it 'removes a middle value' do
        linked_list.remove(1)
        expect(linked_list.get(1)).to be(2)
      end

      it 'removes the tail' do
        linked_list.remove(3)
        expect(linked_list.tail.value).to be(2)
      end
    end
  end
end
