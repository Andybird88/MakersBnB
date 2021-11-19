require 'pg'

class Space

  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:, user_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @user_id = user_id
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
        id: space['s_id'],
        name: space['s_name'],
        description: space['description'],
        price: space['price'],
        user_id: space['user_id']
      )
    end
  end

  def self.create(name:, description:, price:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO spaces (s_name, description, price, owner_id) VALUES ('#{name}', '#{description}', '#{price}', '#{user_id}') RETURNING s_id, s_name, description, price, owner_id;")
    Space.new(id: result[0]['s_id'], name: result[0]['s_name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['owner_id'])
  end

  def self.book
  end

end


