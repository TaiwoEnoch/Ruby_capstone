# book_spec.rb
require_relative '../Classes/book'
require_relative '../Classes/item'

RSpec.describe Book do
  let(:publisher) { 'Sample Publisher' }
  let(:cover_state) { 'good' }
  let(:title) { 'Sample Book' }
  let(:publish_date) { Time.now - 15 }

  subject(:book) { described_class.new(publish_date, publisher, cover_state, title) }

  describe '#initialize' do
    it 'sets the publisher' do
      expect(book.publisher).to eq(publisher)
    end

    it 'sets the cover state' do
      expect(book.cover_state).to eq(cover_state)
    end

    it 'sets the title' do
      expect(book.title).to eq(title)
    end

    it 'sets the publish date' do
      expect(book.publish_date).to eq(publish_date)
    end
  end

  describe '#can_be_archived?' do
    context 'when the cover state is good' do
      let(:cover_state) { 'good' }

      it 'returns false' do
        expect(book.can_be_archived?).to be false
      end
    end

    context 'when the cover state is bad' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end
  end

  describe '#move_to_archive' do
    context 'when the book can be archived' do
      before { allow(book).to receive(:can_be_archived?).and_return(true) }

      it 'marks the book as archived' do
        book.move_to_archive
        expect(book.archived).to be true
      end
    end

    context 'when the book cannot be archived' do
      before { allow(book).to receive(:can_be_archived?).and_return(false) }

      it 'does not mark the book as archived' do
        book.move_to_archive
        expect(book.archived).to be false
      end
    end
  end
end
