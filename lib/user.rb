require 'pg'

class User

    attr_reader :id, :name, :username, :email, :password

    def initialize(id:, name:, username:, email:, password:)
      @id = id
      @name = name
      @username = username
      @email = email
      @password = password
    end

  def self.create(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO users (u_name, username, email, password) VALUES ('#{name}','#{username}','#{email}','#{password}') RETURNING user_id, u_name, username, email, password;")
    User.new(id: result[0]['user_id'], name: result[0]['u_name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find_by(username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    User.new(id: result[0]['user_id'], name: result[0]['u_name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

end