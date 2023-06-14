#label_spec.rb
require_relative '../Classes/label'
require_relative '../Classes/item'

RSpec.describe Label do
  it 'should include added items' do
    test_label = Label.new('test', 'black')
    item1 = Item.new(nil, 'Genre', 'Author', 'Source', test_label)
    item2 = Item.new(nil, 'Fiction', 'John Doe', 'Library', test_label)
    item3 = Item.new(nil, 'Sci-Fi', 'Jane Smith', 'Bookstore', test_label)

    test_label.add_item(item1)
    test_label.add_item(item2)
    test_label.add_item(item3)

    expect(test_label.items.include?(item1)).to be true
    expect(test_label.items.include?(item2)).to be true
    expect(test_label.items.include?(item3)).to be true
    expect(test_label.items.length).to eq(3)
  end
end
