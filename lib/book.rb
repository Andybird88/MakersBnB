require 'pg'

class Book

  attr_reader :start_date, :end_date

  def initialize(start_date:, end_date:)
    @start_date = start_date
    @end_date = end_date
  end

  def self.create(start_date:, end_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO bookings (start_date, end_date) VALUES ('#{start_date}', '#{end_date}') RETURNING start_date, end_date;")
    Book.new(start_date: result[0]['start_date'], end_date: result[0]['end_date'])
  end
end
