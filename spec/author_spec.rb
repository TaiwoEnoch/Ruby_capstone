# author_spec.rb

require_relative '../Classes/item'
require_relative '../Classes/author'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:item) { Item.new('Title', 'Description') }

  describe '#initialize' do
    it 'sets the first name and last name' do
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end

    it 'generates a random ID' do
      expect(author.id).to be_a(String)
    end

    it 'initializes an empty items array' do
      expect(author.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'assigns the author to the item' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end

    it 'adds the item to the author\'s items array' do
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end
end
