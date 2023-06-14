class ListMovie
    def list_movies
        puts 'Listing all movies...'
        File.foreach('Data/movies.json') do |line|
          movie_data = JSON.parse(line)
          puts "Title: #{movie_data['title']}, Genre: #{movie_data['genre']}, Publish Date: #{movie_data['publish_date']}, On Spotify: #{movie_data['on_spotify']}, Silent: #{movie_data['silent']}, Source: #{movie_data['source']}"
        end
    end      
end
