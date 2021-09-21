require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "return true if password and password_confirmation fiels exist" do
      user1 = User.create(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

      expect(user1.password).to eq(user1.password_confirmation)
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user if the user exist, if not return nil' do
      user = User.create(name: 'test', email: 'test@test.com', password: 'password')

      expect(User.authenticate_with_credentials('test@test.com', 'password')).to eq(user)

      expect(User.authenticate_with_credentials('fail@test.com', 'password')).to eq(nil)
      
    end
      
  end
end
