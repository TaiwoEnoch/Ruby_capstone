require_relative '../Classes/item'
require_relative '../Classes/author'
describe Author do
  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:author) { Author.new(first_name, last_name) }
  let(:genre) { 'Fiction' }
  let(:source) { 'Book' }
  let(:label) { 'Publisher' }
  let(:publish_date) { Time.now - 20 } # Example publish date, 20 days ago
  let(:item) { Item.new(genre, author, source, label, publish_date) }


  describe '#initialize' do
    it 'sets the first_name and last_name' do
      expect(author.first_name).to eq(first_name)
      expect(author.last_name).to eq(last_name)
    end

    it 'generates a random ID' do
      expect(author.id).to be_a(String)
      expect(author.id).not_to be_empty
    end

    it 'initializes an empty array of items' do
      expect(author.items).to be_an(Array)
      expect(author.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'sets the author of the item' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end

    it 'adds the item to the author\'s items array' do
      expect do
        author.add_item(item)
      end.to change { author.items.count }.by(1)
    end
  end
end
