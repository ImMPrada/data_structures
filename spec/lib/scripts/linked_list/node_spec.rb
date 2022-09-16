require './spec/spec_helper'

RSpec.describe LinkedList::Node do
  describe 'when initialized' do
    let(:node) { described_class.new(1) }
    let(:another_node) { described_class.new(2, node) }

    it 'returns a Node object' do
      expect(node).to be_a described_class
    end

    describe 'with only a value' do
      it 'has a value' do
        expect(node.value).to eq 1
      end

      it 'has a nil next_node' do
        expect(node.next_node).to be_nil
      end
    end

    describe 'with a value and a next_node' do
      it 'has a value' do
        expect(another_node.value).to eq 2
      end

      it 'has a next_node' do
        expect(another_node.next_node).not_to be_nil
      end
    end
  end
end
