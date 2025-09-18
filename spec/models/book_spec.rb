RSpec.describe Book, type: :model do
  describe 'validations' do
    it 'is valid with a title, author, price, and published_date' do
      book = Book.new(
        title: "Sample Book",
        author: "John Doe",
        price: 9.99,
        published_date: Date.today
      )
      expect(book).to be_valid
    end

    it 'is invalid without a title' do
      book = Book.new(
        title: nil,
        author: "John Doe",
        price: 9.99,
        published_date: Date.today
      )
      expect(book).to_not be_valid
    end

    it 'is invalid without an author' do
      book = Book.new(
        title: "Book",
        author: nil,
        price: 9.99,
        published_date: Date.today
      )
      expect(book).to_not be_valid
    end

    it 'is invalid without a published_date' do
      book = Book.new(
        title: "Book",
        author: "John Doe",
        price: 9.99,
        published_date: nil
      )
      expect(book).to_not be_valid
    end

    it 'is valid with a price of 0 or greater' do
      book = Book.new(
        title: "Book",
        author: "John Doe",
        price: 0,
        published_date: Date.today
      )
      expect(book).to be_valid
    end
  end
end
