require_relative './Classes/list_music'

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
    case choice
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_movies
    when 4
      list_games
    when 5
      list_genres
    when 6
      list_labels
    when 7
      list_authors
    when 8
      list_sources
    when 9
      add_book
    when 10
      add_music_album
    when 11
      add_movie
    when 12
      add_game
    when 13
      exit_app
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def list_books
    puts 'Listing all books...'
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
    puts 'Listing all labels...'
  end

  def list_authors
    puts 'Listing all authors...'
  end

  def list_sources
    puts 'Listing all sources...'
  end

  def add_book
    puts 'Adding a book...'
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
