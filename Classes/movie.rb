require_relative 'item'
require_relative 'source'

class Movie < item
  attr_accessor :silet, :source

  def initialize(silet, source)
    super(nil, nil, nil, nil, nil, source)
    @silet = silet
  end

  def can_be_archived?
    super && silent == true
  end
end