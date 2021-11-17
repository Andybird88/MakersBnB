require 'pg'

class Space

  attr_reader :id, :name, :description, :price, :available

  def initialize(name:, description:, price:, available:)
    @id = id
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

  def self.create(name:,description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO spaces (s_name, description, price) VALUES ('#{name}', '#{description}', '#{price}') RETURNING s_id, s_name, description, price;")
    Space.new(id: result[0]['s_id'], name: result[0]['s_name'], description: result[0]['description'], price: result[0]['price'])
  end

  def self.book
  end

end


