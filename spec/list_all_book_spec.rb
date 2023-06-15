require_relative '../Classes/list_all_book_label'

RSpec.describe BookLabelAddAndShow do
  let(:book_label) { BookLabelAddAndShow.new }

  describe '#add_book' do
    it 'adds a book to the list' do
      allow(book_label).to receive(:gets).and_return('Title', 'Color', '2023-06-07', 'Publisher', 'GOOD')

      expect { book_label.add_book }.to output(/Book added/).to_stdout
    end
  end

  describe '#list_all_books' do
    it 'lists all the books' do
      stored_books = [
        { 'title' => "D'map", 'publisher' => 'Mon', 'publish_date' => '2019-06-03', 'cover_state' => 'GOOD' },
        { 'title' => 'Mom', 'publisher' => 'Gummen', 'publish_date' => '2019-03-03', 'cover_state' => 'GOOD' },
        { 'title' => 'Title', 'publisher' => 'Publisher', 'publish_date' => '2023-06-07', 'cover_state' => 'GOOD' }
      ]
      allow(book_label).to receive(:load_json).and_return(stored_books)

      expect { book_label.list_all_books }.to output(/Book Title: D'map/).to_stdout
      expect { book_label.list_all_books }.to output(/Publisher: Mon/).to_stdout
      expect { book_label.list_all_books }.to output(/Publish Date: 2019-06-03/).to_stdout
      expect { book_label.list_all_books }.to output(/Cover State: GOOD/).to_stdout

      expect { book_label.list_all_books }.to output(/Book Title: Mom/).to_stdout
      expect { book_label.list_all_books }.to output(/Publisher: Gummen/).to_stdout
      expect { book_label.list_all_books }.to output(/Publish Date: 2019-03-03/).to_stdout
      expect { book_label.list_all_books }.to output(/Cover State: GOOD/).to_stdout

      expect { book_label.list_all_books }.to output(/Book Title: Title/).to_stdout
      expect { book_label.list_all_books }.to output(/Publisher: Publisher/).to_stdout
      expect { book_label.list_all_books }.to output(/Publish Date: 2023-06-07/).to_stdout
      expect { book_label.list_all_books }.to output(/Cover State: GOOD/).to_stdout
    end
  end

  describe '#list_all_labels' do
    it 'lists all the labels' do
      stored_labels = [
        { 'title' => "D'map", 'color' => 'red' },
        { 'title' => 'Mom', 'color' => 'Blue' },
        { 'title' => 'Title', 'color' => 'Color' }
      ]
      allow(book_label).to receive(:load_json).and_return(stored_labels)

      expect { book_label.list_all_labels }.to output(/Label: .+, Color: .+/).to_stdout
    end
  end
end
