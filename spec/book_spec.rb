require_relative '../lib/book'


describe Book do
  describe '#.book.create' do
    it 'allows a user to book a space' do
      booking = Book.create(start_date: '18/11/2021', end_date: '19/11/2021')
      expect(booking.start_date).to eq '18/11/2021'
    end
  end
end