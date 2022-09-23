require './spec/spec_helper'

RSpec.describe Stack do
  let(:stack) { described_class.new }

  describe 'when instantiated' do
    it 'creates a new stack' do
      expect(stack).to be_a(described_class)
    end

    it 'is empty' do
      expect(stack.empty?).to be true
    end

    it 'has a nil min' do
      expect(stack.min).to be_nil
    end
  end

  describe '#push' do
    before do
      stack.push(3)
      stack.push(1)
      stack.push(2)
    end

    it 'adds an element to the stack' do
      expect(stack.empty?).to be false
    end

    it 'updates the min' do
      expect(stack.min).to eq 1
    end
  end

  describe '#pop' do
    let(:last_element) { 56 }
    let(:min_value) { -56 }

    before do
      stack.push(1)
      stack.push(2)
      stack.push(min_value)
      stack.push(last_element)
    end

    it 'returns removed element' do
      expect(stack.pop).to be(last_element)
    end

    it 'updates the min' do
      expect(stack.min).to eq(min_value)
    end

    describe 'when #pop empties the stack' do
      before do
        stack.pop
        stack.pop
        stack.pop
        stack.pop
      end

      it 'is empty' do
        expect(stack.empty?).to be true
      end

      it 'returns nil' do
        expect(stack.pop).to be_nil
      end
    end
  end
end
