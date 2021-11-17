require_relative '../lib/user'

describe User do
  describe '.#create' do
    it 'creates a new user' do
      user = User.create(name: 'John', username:'John_makers', email: 'test11@test.com', password:'test')

      expect(user.email).to eq 'test11@test.com'
    end
  end
end
