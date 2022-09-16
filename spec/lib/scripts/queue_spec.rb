require './spec/spec_helper'

RSpec.describe Queue do
  let(:queue) { described_class.new }

  describe 'when instantiated' do
    it 'creates a new queue' do
      expect(queue).to be_a(described_class)
    end

    it 'is empty' do
      expect(queue.empty?).to be true
    end
  end

  describe '#add' do
    it 'adds an element to the stack' do
      queue.add(1)
      expect(queue.empty?).to be false
    end
  end

  describe '#remove' do
    let(:expected_element) { 56 }

    before do
      queue.add(expected_element)
      queue.add(1)
      queue.add(2)
    end

    it 'returns removed element' do
      expect(queue.remove).to be(expected_element)
    end

    describe 'when #remove empties the queue' do
      before do
        queue.remove
        queue.remove
        queue.remove
      end

      it 'is empty' do
        expect(queue.empty?).to be true
      end

      it 'returns -1' do
        expect(queue.remove).to be(-1)
      end
    end
  end

  describe '#empty?' do
    it 'returns true' do
      expect(queue.empty?).to be true
    end

    it 'returns false' do
      queue.add(1)
      expect(queue.empty?).to be false
    end
  end
end
