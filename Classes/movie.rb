require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_accessor :silent, :source

  def initialize(silent, source)
    super(nil, nil, nil, nil, source)
    @silent = silent
  end

  def can_be_archived?
    super && silent == true
  end
end
