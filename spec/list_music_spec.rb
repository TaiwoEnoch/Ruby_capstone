require_relative '../Classes/list_music'

describe MusicList do
  before do
    @album = [
      { id: 100, publish_date: '2023-04-07', on_spotify: true },
      { id: 120, publish_date: '2023-12-12', on_spotify: true }
    ]
    @genre = [
      { name: 'Rock' },
      { name: 'Pop' }
    ]
  end

  it 'should return album' do
    expect(@album[1][:publish_date]).to eql('2023-12-12')
  end

  it 'should return genre' do
    expect(@genre[1][:name]).to eql('Pop')
  end

  it 'should return album ID' do
    expect(@album[0][:id]).to eql(100)
  end

  it 'should return genre name' do
    expect(@genre[0][:name]).to eql('Rock')
  end
end
