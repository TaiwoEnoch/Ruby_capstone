require 'json'
require_relative 'game'
require_relative 'author'

class Library
  def initialize
    @games = []
    @authors = []
  end

  def load_data
    @games = load_json_data('../data/games.json', Game)
    @authors = load_json_data('../data/authors.json', Author)
  end

  def save_data
    save_json_data('../data/games.json', @games)
    save_json_data('../data/authors.json', authors)
  end

  def list_games
    puts 'List of games:'
    @games.each_with_index do |game, index|
      puts "#{index + 1}. #{game.title} (Genre: #{game.genre}, Author: #{game.author.name})"
    end
  end

  def list_authors
    puts 'List of authors:'
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.name}"
    end
  end

  def add_game(title, genre, author_name)
    author = find_or_create_author(author_name)
    game = Game.new(title, genre, author)
    @games << game
    puts 'Game added successfully!'
  end

  private

  def load_json_data(file_name, object_class)
    json_data = File.read(file_name)
    parsed_data = JSON.parse(json_data)
    parsed_data.map { |data| object_class.from_json(data.to_json) }
  end

  def save_json_data(file_name, data)
    json_data = data.map(&:to_json)
    File.write(file_name, JSON.pretty_generate(json_data))
  end

  def find_or_create_author(author_name)
    existing_author = @authors.find { |author| author.name == author_name }
    return existing_author if existing_author

    new_author = Author.new(author_name)
    @authors << new_author
    new_author
  end
end
