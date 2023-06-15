require_relative '../Modules/list_movie'
require_relative '../Modules/add_movie'

describe AddMovie do
    it 'Creates a new Movie' do
        movie = AddMovie.new
        expect(movie).to be_a(AddMovie)
    end
end

describe ListMovie do
    it 'Lists all movies' do
        movie = ListMovie.new
        expect(movie.list_movies).to be_a(ListMovie)
    end
end
