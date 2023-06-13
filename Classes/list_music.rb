require_relative 'music'
require_relative 'item'
require_relative 'genre'
require 'json'

class MusicList
  attr_accessor :albums, :genres

  def initialize
    @albums = []
    @genres = []
    recover_data
    recover_genre
  end

  def list_all_genre
    puts 'No genre added' if @genres.empty?
    @genres.each { |genre| puts "Genre: #{genre.name}" }
    puts ''
  end

  def list_all_music_albums
    puts 'No music added' if @albums.empty?
    @albums.each do |album|
      puts "Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
    end
    puts ''
  end

  def add_music_album
    print 'Publish date (Year-MM-DD): '
    publish_date = gets.chomp
    on_spotify = prompt_on_spotify

    music_album = Music.new(on_spotify, publish_date)
    @albums << music_album
    puts 'Album created successfully'
    puts ''

    print 'Add genre (Pop, Rock, HipHop, Comedy, Thriller): '
    name = gets.chomp

    genre = @genres.find { |g| g.name == name }
    if genre.nil?
      genre = Genre.new(name)
      @genres << genre
      puts "#{name} genre created successfully"
    end

    genre.add_item(music_album)
    save
  end

  def prompt_on_spotify
    loop do
      print 'On Spotify (Enter t-True/f-False): '
      input = gets.chomp.downcase
      return input == 't' if %w[t f].include?(input)

      puts 'Invalid input. Please enter either t or f.'
    end
  end

  def save
    albums_data = @albums.map do |album|
      { id: album.id, publish_date: album.publish_date, on_spotify: album.on_spotify }
    end
    genres_data = @genres.map { |genre| { name: genre.name } }

    File.write('data/music.json', JSON.pretty_generate(albums_data))
    File.write('data/genre.json', JSON.pretty_generate(genres_data))
  end

  def recover_data
    return unless File.exist?('data/music.json')

    album_store = begin
      JSON.parse(File.read('data/music.json'))
    rescue StandardError
      []
    end
    album_load = album_store.map { |music| Music.new(music['on_spotify'], music['publish_date']) }
    @albums.concat(album_load) unless album_load.empty?
  end

  def recover_genre
    return unless File.exist?('data/genre.json')

    genre_store = begin
      JSON.parse(File.read('data/genre.json'))
    rescue StandardError
      []
    end

    genre_load = genre_store.map { |genre_data| Genre.new(genre_data['name']) }

    @genres.concat(genre_load) unless genre_load.empty?
  end
end
