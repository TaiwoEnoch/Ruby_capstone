require_relative '../Classes/game_list'
require_relative '../Classes/game'
require_relative '../Classes/author'

RSpec.describe GameList do
  let(:games_file_path) { 'path/to/games.json' }
  let(:authors_file_path) { 'path/to/authors.json' }
  let(:game_list) { GameList.new(games_file_path, authors_file_path) }

  describe '#list_all_authors' do
    context 'when authors are empty' do
      it 'prints "No authors added"' do
        expect { game_list.list_all_authors }.to output("No authors added\n\n").to_stdout
      end
    end

    context 'when authors are not empty' do
      let(:author1) { Author.new('Jane', 'Doe') }
      let(:author2) { Author.new('John', 'Smith') }

      before do
        game_list.authors = [author1, author2]
      end

      it 'prints all author names' do
        expect { game_list.list_all_authors }.to output("Author: Jane Doe\nAuthor: John Smith\n\n").to_stdout
      end
    end
  end

  describe '#prompt_multiplayer' do
    it 'returns true when input is "t"' do
      allow(game_list).to receive(:gets).and_return("t\n")
      expect(game_list.send(:prompt_multiplayer)).to be true
    end

    it 'returns false when input is "f"' do
      allow(game_list).to receive(:gets).and_return("f\n")
      expect(game_list.send(:prompt_multiplayer)).to be false
    end

    it 'prompts for input until valid' do
      allow(game_list).to receive(:gets).and_return("invalid\n", "t\n")
      expect(game_list.send(:prompt_multiplayer)).to be true
    end
  end
end
