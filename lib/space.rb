require 'pg'

class Space

  attr_reader :name, :description, :price, :available

  def initialize(name:, description:, price:, available:)
    @name = name
    @description = description
    @price = price
    @available = available
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM spaces;")
    result.map do |space|
      Space.new(
        name: space['s_name'],
        description: space['description'],
        price: space['price'],
        available: true
      )
    end
  end

  def self.create
  end

  def self.book
  end

end


