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
        puts "ID: #{game.id}"
        puts "Publish Date: #{game.publish_date}"
        puts "Multiplayer: #{game.multiplayer}"
        puts "Last Played At: #{game.last_played_at}"
        puts ''
      end
    end
    puts ''
  end

  def add_game
    multiplayer = prompt_multiplayer
    last_played_at = prompt_date('Last played at (YYYY-MM-DD): ')
    publish_date = prompt_date('Publish date (YYYY-MM-DD): ')

    author = select_author
    game = Game.new(multiplayer, last_played_at, nil, author, publish_date)
    games << game
    puts 'Game added successfully'
    puts ''

    author.add_item(game)
    save_authors
    save
  end

  def select_author
    if authors.empty?
      puts 'No authors added. Creating a new author...'
      author = create_author
      authors << author
      save_authors
    else
      puts 'Choose an option:'
      puts '1. Select an existing author'
      puts '2. Create a new author'
      print 'Enter your choice: '
      choice = gets.chomp.to_i

      case choice
      when 1
        author = select_existing_author
      when 2
        author = create_author
        authors << author
        save_authors
      else
        puts 'Invalid choice. Creating a new author...'
        author = create_author
        authors << author
        save_authors
      end
    end

    author
  end

  def select_existing_author
    unique_authors = authors.uniq { |author| "#{author.first_name} #{author.last_name}" }

    if unique_authors.empty?
      puts 'No authors available. Creating a new author...'
      create_author
    else
      puts 'Select an author:'
      unique_authors.each_with_index { |author, index| puts "#{index + 1}. #{author.first_name} #{author.last_name}" }
      print 'Enter the number of the author: '
      author_index = gets.chomp.to_i - 1

      if author_index.between?(0, unique_authors.size - 1)
        unique_authors[author_index]
      else
        puts 'Invalid author selection. Creating a new author...'
        create_author
      end
    end
  end

  def save_authors
    author_data = authors.map do |author|
      {
        first_name: author.first_name,
        last_name: author.last_name
      }
    end

    File.write(@authors_file_path, JSON.pretty_generate(author_data))
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

  def prompt_date(message)
    print message
    gets.chomp
  end

  def save
    games_data = games.map do |game|
      {
        id: game.id,
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        label: game.label
      }
    end

    existing_data = []
    existing_data = JSON.parse(File.read(@games_file_path)) if File.exist?(@games_file_path)

    new_data = existing_data + games_data

    File.write(@games_file_path, JSON.pretty_generate(new_data))
  end

  def recover_data
    return unless File.exist?(@games_file_path)

    game_store = JSON.parse(File.read(@games_file_path))
    game_load = game_store.map { |game| create_game_from_json(game) }
    games.concat(game_load.compact) unless game_load.empty?
  rescue JSON::ParserError => e
    puts "Error reading games data: #{e.message}"
  end

  def create_game_from_json(game)
    author_data = game['author']
    if author_data.nil?
      puts 'Author data missing for a game. Skipping game.'
      return nil
    end

    author = find_author(author_data['first_name'], author_data['last_name'])
    if author
      existing_game = find_game(game['id'])
      if existing_game
        puts "Game with ID '#{game['id']}' already exists. Skipping game."
        return nil
      end
      Game.new(game['multiplayer'], game['last_played_at'], game['id'], author, game['publish_date'])
    else
      puts "Author '#{author_data['first_name']} #{author_data['last_name']}' not found. Skipping game."
      nil
    end
  end

  def find_game(id)
    games.find { |game| game.id == id }
  end

  def find_author(first_name, last_name)
    authors.find { |author| author.first_name == first_name && author.last_name == last_name }
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
