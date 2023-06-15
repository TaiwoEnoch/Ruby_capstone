require 'json'
require_relative '../Classes/movie'

class AddMovie
  def initialize
    @movie = Movie.new(nil, nil)
  end

  def run
    puts 'Adding a movie...'
    puts 'Please enter the following information:'

    print 'Silent (Enter t-True/f-False): '
    @movie.silent = gets.chomp.downcase

    print 'Source: '
    @movie.source = gets.chomp

    save_movie_to_file

    puts 'Movie created successfully'
    puts ''
  end

  def save_movie_to_file
    movie_data = {
      silent: @movie.silent,
      source: @movie.source
    }

    File.open('Data/movies.json', 'a') do |file|
      file.puts(JSON.generate(movie_data))
    end

    sources = []
    if File.exist?('Data/sources.json') && !File.empty?('Data/sources.json')
      begin
        sources = JSON.parse(File.read('Data/sources.json'))
      rescue JSON::ParserError => e
        puts "Error parsing sources.json: #{e.message}"
      end
    end

    return if sources.any? { |src| src['source'] == @movie.source }

    sources << { source: @movie.source }
    File.open('Data/sources.json', 'w') do |file|
      file.puts(JSON.generate(sources))
    end
  end
end
