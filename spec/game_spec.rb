require_relative '../Classes/game'
require_relative '../Classes/item'
require 'rspec'

describe Game do
  let(:multiplayer) { true }
  let(:last_played_at) { Time.now - (2 * 365 * 24 * 60 * 60) - 1 } # Played just before the threshold
  let(:label) { 'Game Label' }
  let(:author) { 'John Doe' }
  let(:publish_date) { Time.now - (2 * 365 * 24 * 60 * 60) } # Published exactly at the threshold
  let(:game) { Game.new(multiplayer, last_played_at, label, author, publish_date) }

  describe '#initialize' do
    it 'sets the multiplayer, last_played_at, label, author, and publish_date' do
      expect(game.multiplayer).to eq(multiplayer)
      expect(game.last_played_at).to eq(last_played_at)
      expect(game.label).to eq(label)
      expect(game.author).to eq(author)
      expect(game.publish_date).to eq(publish_date)
    end

    it 'calls the super constructor with appropriate arguments' do
      expect(game.genre).to be_nil
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if last_played_at is older than 2 years' do
      expect(game.can_be_archived?).to eq(true)
    end

    it 'returns false if last_played_at is within 2 years' do
      game.last_played_at = Time.now - (2 * 365 * 24 * 60 * 60) + 1 # Played just after the threshold
      expect(game.can_be_archived?).to eq(false)
    end
  end
end
