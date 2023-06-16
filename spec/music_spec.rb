require 'rspec'
require_relative '../Classes/music'

describe Music do
  let(:publish_date) { Time.new(2022, 1, 1) }
  let(:music) { Music.new(true, publish_date) }

  describe '#initialize' do
    it 'sets the on_spotify attribute' do
      expect(music.on_spotify).to be true
    end

    it 'sets the publish_date attribute' do
      expect(music.publish_date).to eq publish_date
    end
  end
end
