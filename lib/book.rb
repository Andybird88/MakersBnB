require 'pg'

class Book

  attr_reader :b_id, :start_date, :end_date, :approved, :user_id, :space_id

  def initialize(b_id:, start_date:, end_date:, approved:, user_id:, space_id:)
    @b_id = b_id
    @user_id = user_id
    @space_id = space_id
    @start_date = start_date
    @end_date = end_date
    @approved = approved
  end

  def self.create(start_date:, end_date:, user_id:, space_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO bookings (start_date, end_date, user_id, space_id) VALUES ('#{start_date}', '#{end_date}', '#{user_id}', '#{space_id}') RETURNING b_id, start_date, end_date, user_id, space_id;")
    Book.new(b_id: result[0]['b_id'], start_date: result[0]['start_date'], end_date: result[0]['end_date'], approved: result[0]['approved'], user_id: result[0]['user_id'], space_id: result[0]['space_id'])
  end
end
