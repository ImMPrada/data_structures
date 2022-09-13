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
    let(:linked_list) { LinkedList.new }

    it 'returns a LinkedList object' do
      expect(linked_list).to be_a LinkedList
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
  end
end
