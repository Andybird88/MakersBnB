require_relative '../lib/space'

describe Space do
    describe '#self.all' do
        it 'displays list of spaces' do
            connection = PG.connect(dbname: 'makersbnb_test')

            #connection.exec("INSERT INTO users (email, password, u_name, username) VALUES ('test1@test.com', 'test', 'LukeC', 'Luke-the-duke');")
            # connection.exec("INSERT INTO users (email, password, u_name, username) VALUES ('test2@test.com', 'test', 'GinnyT', 'ginnyamazed');")
            # connection.exec("INSERT INTO users (email, password, u_name, username) VALUES ('test3@test.com', 'test', 'DylanJ', 'DylanRJ');")
            # connection.exec("INSERT INTO users (email, password, u_name, username) VALUES ('test4@test.com', 'test', 'AndyB', 'AndyB');")

            connection.exec("INSERT INTO spaces (s_name, description, price, owner_id) VALUES ('Beach Cove Hideaway', 'Cozy cabin in Cornwall', '200.00', '1' );")
            connection.exec("INSERT INTO spaces (s_name, description, price, owner_id) VALUES ('Roman Bungalow', '2 bedroom bungalow in York', '350.00', '3' );")
            connection.exec("INSERT INTO spaces (s_name, description, price, owner_id) VALUES ('City Views Apartment', 'Studio apartment in London overlooking Thames and the gerkin', '300.00', '4' );")

            spaces = Space.all

            expect(spaces.first.name).to eq 'Beach Cove Hideaway'

          
        end
    end
end