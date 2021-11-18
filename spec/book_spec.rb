require_relative '../lib/book'


describe Book do
  describe '#.book.create' do
    it 'allows a user to book a space' do
      booking = Book.create(start_date: '2021-11-18', end_date: '2021-11-19')
      expect(booking.start_date).to eq '2021-11-18'
    end
  end
end