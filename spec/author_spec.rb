require_relative '../Classes/author'
require_relative '../Classes/item'
require 'rspec'

RSpec.describe Author do
  let(:author) { Author.new(1, 'John', 'Doe') }
  let(:item) { Item.new('Genre', nil, nil, nil, nil) }

  describe '#add_item' do
    it 'adds the item to the author\'s collection of items' do
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'sets the author as the item\'s author' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end
  end
end
