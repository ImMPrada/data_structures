require './spec/spec_helper'

RSpec.describe LinkedList::SingleLinkedList do
  let(:linked_list) { described_class.new }

  describe 'when initialized' do
    it 'returns a LinkedList object' do
      expect(linked_list).to be_a described_class
    end

    it 'has nil head' do
      expect(linked_list.head).to be_nil
    end

    it 'has nil tail' do
      expect(linked_list.tail).to be_nil
    end
  end

  describe '#add' do
    before do
      linked_list.add(1)
    end

    it 'has a head' do
      expect(linked_list.head).not_to be_nil
    end

    it 'has a tail' do
      expect(linked_list.tail).not_to be_nil
    end

    it 'returns the value added' do
      expect(linked_list.add(2)).to eq 2
    end
  end

  describe '#get' do
    let(:first_value) { 1 }
    let(:second_value) { 2 }

    before do
      linked_list.add(first_value)
      linked_list.add(second_value)
    end

    it 'returns the value of the node at the specified index' do
      expect(linked_list.get(1)).to eq second_value
    end
  end

  describe '#add_at' do
    let(:new_head_value) { 11 }
    let(:new_middle_value) { 13 }
    let(:new_tail_value) { 25 }
    let(:wrong_index) { 50 }

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

    it 'returns added value' do
      expect(linked_list.add(25)).to be(25)
    end

    it 'returns nil with index out of range' do
      expect(linked_list.add_at(wrong_index, 1)).to be_nil
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

    it 'returns removed value' do
      expect(linked_list.remove(0)).to be(5)
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
  
  describe '#generate_array' do
    before do
      linked_list.add(5)
      linked_list.add(3)
      linked_list.add(2)
      linked_list.add(1)
    end

    it 'returns an array with the values of the nodes' do
      expect(linked_list.generate_array).to eq [5, 3, 2, 1]
    end
  end
end
