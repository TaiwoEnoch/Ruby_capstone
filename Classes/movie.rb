require_relative 'item'
require_relative 'source'

class Movie < Item
  attr_accessor :title, :genre, :publish_date, :on_spotify, :silent, :source

  def initialize(title = nil, genre = nil, publish_date = nil, on_spotify = nil, silent = nil, source = nil)
    @title = title
    @genre = genre
    @publish_date = publish_date
    @on_spotify = on_spotify
    @silent = silent
    @source = source
  end

  def can_be_archived?
    super && silent == true
  end
end
