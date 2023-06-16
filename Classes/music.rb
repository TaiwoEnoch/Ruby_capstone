require_relative 'item'
require_relative 'genre'

class Music < Item
  attr_accessor :on_spotify, :publish_date

  def initialize(on_spotify, publish_date)
    super(nil, nil, nil, nil, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify == true
  end
end
