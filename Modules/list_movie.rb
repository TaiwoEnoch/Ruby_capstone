require 'json'

class ListMovie
  def list_movies
    puts 'Listing all movies...'
    return unless File.exist?('Data/movies.json')

    File.foreach('Data/movies.json') do |line|
      movie_data = JSON.parse(line)
      display_movies(movie_data)
    end
  end

  def display_movies(movie_data)
    print "Publish Date: #{movie_data['publish_date']}, "
    print "Silent: #{movie_data['silent']}, "
    puts "Source: #{movie_data['source']}"
  end
end
