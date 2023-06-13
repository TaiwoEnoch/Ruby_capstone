require_relative 'item'
require_relative 'author'
require_relative 'game'
require 'json'

class GameList
  attr_accessor :games, :authors

  def initialize(games_file_path, authors_file_path)
    @games_file_path = games_file_path
    @authors_file_path = authors_file_path
    @games = []
    @authors = []
    recover_data
    recover_authors
  end

  def list_all_authors
    if authors.empty?
      puts 'No authors added'
    else
      authors.each { |author| puts "Author: #{author.first_name} #{author.last_name}" }
    end
    puts ''
  end

  def list_all_games
    if games.empty?
      puts 'No games added'
    else
      games.each do |game|
        puts "Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}"
      end
    end
    puts ''
  end

  def add_game
    multiplayer = prompt_multiplayer
    print 'Last played at (YYYY-MM-DD): '
    last_played_at = gets.chomp
    game = Game.new(multiplayer, last_played_at)
    games << game
    puts 'Game added successfully'
    puts ''

    author = select_author
    author.add_item(game)
    authors << author
    save
  end

  def select_author
    puts 'Select an option:'
    puts '1. Random famous author'
    puts '2. Create a new author'
    print 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      generate_famous_author
    when 2
      create_author
    else
      puts 'Invalid choice. Creating a new author by default.'
      create_author
    end
  end

  def generate_famous_author
    famous_authors = [
      { first_name: 'Stephen', last_name: 'King' },
      { first_name: 'J.K.', last_name: 'Rowling' },
      { first_name: 'George', last_name: 'Orwell' },
      { first_name: 'Agatha', last_name: 'Christie' }
    ]

    author_info = famous_authors.sample
    Author.new(author_info[:first_name], author_info[:last_name])
  end

  def create_author
    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp

    Author.new(first_name, last_name)
  end

  def prompt_multiplayer
    loop do
      print 'Multiplayer (Enter t-True/f-False): '
      input = gets.chomp.downcase
      return true if input == 't'
      return false if input == 'f'

      puts 'Invalid input. Please enter either t or f.'
    end
  end

  def save
    games_data = games.map do |game|
      { multiplayer: game.multiplayer, last_played_at: game.last_played_at }
    end
    authors_data = authors.map do |author|
      { first_name: author.first_name, last_name: author.last_name }
    end

    File.write(@games_file_path, JSON.pretty_generate(games_data))
    File.write(@authors_file_path, JSON.pretty_generate(authors_data))
  end

  def recover_data
    return unless File.exist?(@games_file_path)

    game_store = JSON.parse(File.read(@games_file_path))
    game_load = game_store.map { |game| Game.new(game['multiplayer'], game['last_played_at']) }
    games.concat(game_load) unless game_load.empty?
  rescue JSON::ParserError => e
    puts "Error reading games data: #{e.message}"
  end

  def recover_authors
    return unless File.exist?(@authors_file_path)

    author_store = JSON.parse(File.read(@authors_file_path))
    author_load = author_store.map { |author| Author.new(author['first_name'], author['last_name']) }
    authors.concat(author_load) unless author_load.empty?
  rescue JSON::ParserError => e
    puts "Error reading authors data: #{e.message}"
  end
end
