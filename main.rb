require_relative './Classes/list_music'
require_relative './Classes/list_all_book_label'

class Main
  def initialize
    puts '********-------------------------********'
    puts '      Welcome to our catalog app      '
    puts '********-------------------------********'
    puts
  end

  def select_option
    puts 'Please choose an option by entering a number:'
    puts '1). List all books'
    puts '2). List all music albums'
    puts '3). List all movies'
    puts '4). List all games'
    puts '5). List all genres'
    puts '6). List all labels'
    puts '7). List all authors'
    puts '8). List all sources'
    puts '9). Add a book'
    puts '10). Add a music album'
    puts '11). Add a movie'
    puts '12). Add a game'
    puts '13). Exit'
  end

  def run
    loop do
      select_option
      choice = gets.chomp.to_i
      handle_choice(choice)
      puts
    end
  end

  def handle_choice(choice)
    actions = {
      1 => method(:list_books), 2 => method(:list_music_albums), 3 => method(:list_movies),
      4 => method(:list_games), 5 => method(:list_genres), 6 => method(:list_labels),
      7 => method(:list_authors), 8 => method(:list_sources), 9 => method(:add_book),
      10 => method(:add_music_album), 11 => method(:add_movie), 12 => method(:add_game),
      13 => method(:exit_app)
    }
    action = actions[choice]
    if action
      action.call
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def list_books
    stored_book = BookLabelAddAndShow.new
    stored_book.list_all_books
  end

  def list_music_albums
    music_list = MusicList.new
    music_list.list_all_music_albums
  end

  def list_movies
    puts 'Listing all movies...'
  end

  def list_games
    puts 'Listing all games...'
  end

  def list_genres
    music_list = MusicList.new
    music_list.list_all_genre
  end

  def list_labels
    stored_label = BookLabelAddAndShow.new
    stored_label.list_all_labels
  end

  def list_authors
    puts 'Listing all authors...'
  end

  def list_sources
    puts 'Listing all sources...'
  end

  def add_book
    store_book = BookLabelAddAndShow.new
    store_book.add_book
  end

  def add_music_album
    music_list = MusicList.new
    music_list.add_music_album
  end

  def add_movie
    puts 'Adding a movie...'
  end

  def add_game
    puts 'Adding a game...'
  end

  def exit_app
    puts 'Exiting the app. Goodbye!'
    exit
  end
end

app = Main.new
app.run
