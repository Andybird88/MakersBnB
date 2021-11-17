require_relative '../lib/user'

describe User do
  describe '#.create' do
    it 'creates a new user' do
      expect(User.create).to eq "John_makers"
    end
  end
end