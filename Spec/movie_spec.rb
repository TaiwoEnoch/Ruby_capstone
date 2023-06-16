require_relative '../Modules/list_movie'
require_relative '../Classes/movie'

describe Movie do
  movie = Movie.new('2020-01-01', 't')
  it 'Adds a movie' do
    expect(movie).to be_a(Movie)
  end
end

describe ListMovie do
  describe '#list_movies' do
    list_movie = ListMovie.new
    it 'prints the details of each movie' do
      movies_data = { publish_date: '2022-01-01', silent: true, source: 'Netflix' }
      expect do
        list_movie.display_movies(movies_data)
      end.to output("Publish Date: 2022-01-01, Silent: true, Source: Netflix\n").to_stdout
    end
  end
end
