require_relative '../Classes/genre'
require_relative '../Classes/item'

describe Genre do
  test_genre = Genre.new('test')
  item = Item.new('Title', 'Author', 'Description', '2000/03/24', test_genre)

  it 'test_genre should return "test" as its name' do
    expect(test_genre.name).to eq('test')
  end

  it 'After adding one item "item" to test_genre, its items array should include "item"' do
    test_genre.add_item(item)

    expect(test_genre.items.include?(item)).to be true
  end
end
