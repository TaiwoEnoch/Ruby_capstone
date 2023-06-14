class AuthorOperations
  def select_author(authors, authors_file_path)
    if authors.empty?
      puts 'No authors added. Creating a new author...'
      author = create_author
      authors << author
      save_authors(authors, authors_file_path)
    else
      choice = display_author_options(authors)
      author = process_author_choice(choice, authors, authors_file_path)
    end

    author
  end

  def display_author_options(_authors)
    puts 'Choose an option:'
    puts '1. Select an existing author'
    puts '2. Create a new author'
    print 'Enter your choice: '
    gets.chomp.to_i
  end

  def process_author_choice(choice, authors, authors_file_path)
    case choice
    when 1
      select_existing_author(authors)
    when 2
      create_author_and_save(authors, authors_file_path)
    else
      puts 'Invalid choice. Creating a new author...'
      create_author_and_save(authors, authors_file_path)
    end
  end

  def create_author_and_save(authors, authors_file_path)
    author = create_author
    authors << author
    save_authors(authors, authors_file_path)
    author
  end


  private

  def save_authors(authors, authors_file_path)
    author_data = authors.map do |author|
      {
        first_name: author.first_name,
        last_name: author.last_name
      }
    end

    File.write(authors_file_path, JSON.pretty_generate(author_data))
  end

  def create_author
    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp

    Author.new(first_name, last_name)
  end

  def select_existing_author(authors)
    puts 'Select an author:'
    authors.each_with_index { |author, index| puts "#{index + 1}. #{author.first_name} #{author.last_name}" }
    print 'Enter the number corresponding to the author: '
    choice = gets.chomp.to_i

    authors[choice - 1]
  end
end
