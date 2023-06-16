require_relative 'item'

class Author
  attr_reader :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = generate_random_id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end

  private

  def generate_random_id
    random_number = rand(1000..9999)
    random_number.to_s
  end
end
