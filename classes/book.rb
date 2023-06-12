require_relative 'item'

class Book < Item
  attr_reader :publisher :cover_state

  def initialize(present_date, publisher, cover_state)
    super(published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || 'bad'
  end
end
