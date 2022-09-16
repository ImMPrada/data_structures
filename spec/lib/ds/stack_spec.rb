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
  end

  describe '#push' do
    it 'adds an element to the stack' do
      stack.push(1)
      expect(stack.empty?).to be false
    end
  end
end
