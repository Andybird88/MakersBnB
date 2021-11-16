# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'setting up test database ...'
  connection = PG.connect(dbname: 'makersbnb_test')
  # clear the bookmark table prior to rspec tests
  connection.exec('TRUNCATE spaces CASCADE;')
end
