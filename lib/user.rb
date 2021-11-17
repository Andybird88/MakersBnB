class User

    attr_reader :name, :username, :email, :password

    def initialize(name:, username:, email:, password:)
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
    connection.exec("INSERT INTO users (u_name, username, email, password) VALUES ('#{name}','#{username}','#{email}','#{password}');")
    
  end

end