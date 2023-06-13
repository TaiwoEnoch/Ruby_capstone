require_relative '../Classes/game'
require_relative '../Classes/item'
require 'rspec'
RSpec.describe Game do
  let(:last_played_date) { Time.now - (3 * 365 * 24 * 60 * 60) } # Last played date more than 2 years ago
  let(:game) { Game.new(true, last_played_date) }

  describe '#can_be_archived?' do
    context 'when the last_played_at is older than 2 years' do
      it 'returns true' do
        expect(game.can_be_archived?).to eq(true)
      end
    end

    context 'when the last_played_at is within 2 years' do
      it 'returns false' do
        game.last_played_at = Time.now
        expect(game.can_be_archived?).to eq(false)
      end
    end
  end
end
