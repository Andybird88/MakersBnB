require 'pg'

class Book

  attr_reader :b_id, :start_date, :end_date, :approved # :user_id, :space_id

  def initialize(b_id:, start_date:, end_date:, approved:)
    @b_id = b_id
    # @user_id = user_id
    # @space_id = space_id
    @start_date = start_date
    @end_date = end_date
    @approved = approved
  end

  def self.create(start_date:, end_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO bookings (start_date, end_date) VALUES ('#{start_date}', '#{end_date}') RETURNING b_id, start_date, end_date;")
    Book.new(b_id: result[0]['b_id'], start_date: result[0]['start_date'], end_date: result[0]['end_date'], approved: result[0]['approved'])
  end
end
