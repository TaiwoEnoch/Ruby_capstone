class ListMovie
  def list_movies
    puts 'Listing all movies...'
    return if !File.exist?('Data/movies.json')
    File.foreach('Data/movies.json') do |line|
      movie_data = JSON.parse(line)
      print "Publish Date: #{movie_data['publish_date']}, "
      print "Silent: #{movie_data['silent']}, "
      puts "Source: #{movie_data['source']}"
    end
  end
end
