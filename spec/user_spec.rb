require_relative '../lib/user'

describe User do
  describe '#create' do
    it 'creates a new user' do
      user = User.create(name: 'John', username:'John_makers', email: 'test11@test.com', password:'test')

      expect(user.email).to eq 'test11@test.com'
    end
  end

  describe '#find_by' do
    it 'finds user by username and password' do
      user = User.create(name: 'John', username:'John_makers', email: 'test11@test.com', password:'test')
      sign_in = User.find_by(id: user.id)
      expect(sign_in.username). to eq 'John_makers'
      expect(sign_in.id).to eq user.id
    end
  end
end
