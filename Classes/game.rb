require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super('Game')
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = nil
  end

  def can_be_archived?
    last_played_at < (Time.now - (2 * 365 * 24 * 60 * 60))
  end

  attr_writer :author
end
