require 'rails_helper'

RSpec.describe UsersController do
  describe 'Creating a New Account' do
    it 'Should create a new account if provided valid info' do
      expect(User).to receive(:create!).and_return(double('User'))
      post :create_account, { username: 'Ted', password: 'yes', email: 'lol@gmail.com' }

    end
    it 'Should fail to create a new account if provided invalid info' do

    end
  end

end
