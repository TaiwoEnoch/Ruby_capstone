require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_accessor :silent, :publish_date

  def initialize(silent, publish_date)
    super(nil, nil, nil, nil, publish_date)
    @silent = silent
  end

  def can_be_archived?
    super && silent == true
  end
end
