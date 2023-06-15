class ListMovie
  def list_movies
    puts 'Listing all movies...'
    File.foreach('Data/movies.json') do |line|
      movie_data = JSON.parse(line)
      puts "Silent: #{movie_data['silent']}, Source: #{movie_data['source']}"
    end
  end
end
