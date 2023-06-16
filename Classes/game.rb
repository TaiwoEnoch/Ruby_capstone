require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :label, :author, :publish_date

  def initialize(multiplayer, last_played_at, label, author, publish_date)
    super(nil, nil, label, author, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @label = label
    @author = author
    @publish_date = publish_date
  end

  def can_be_archived?
    last_played_at < (Time.now - (2 * 365 * 24 * 60 * 60))
  end
end
