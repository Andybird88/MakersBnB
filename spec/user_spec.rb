require_relative '../lib/user'

describe User do
  describe '.#create' do
    it 'creates a new user' do
      test = User.create(name: 'John', username:'John_makers', email: 'test11@test.com', password:'test')
      expect(test['email']).to_be "test11@test.com"
 
    end
  end
end

