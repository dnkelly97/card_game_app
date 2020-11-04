require 'rails_helper'

RSpec.describe UsersController do
  describe 'Creating a New Account' do
    before(:all) do
      expect(User).to receive(:create!)
    end
    it 'Should create a new account if provided valid info' do
      # Valid
      test_params = { user_id: 'kev', password: 'asdf123', password_confirmation: 'asdf123',
                      email: 'me@google.com', email_confirmation: 'me@google.com' }
      post :create_account, test_params

    end
    it 'password must be 7-20 characters, have letter+number and a confirmation' do

      # Invalid
      test_params = { user_id: 'kev', password: '12345', password_confirmation: '12345',
                      email: 'me@google.com', email_confirmation: 'me@google.com' }

      post :create_account, test_params

      test_params = { user_id: 'kev', password: 'asdf', password_confirmation: 'asdf',
                      email: 'me@google.com', email_confirmation: 'me@google.com' }

      post :create_account, test_params

      test_params = { user_id: 'kev', password: '12121212asas12121212a', password_confirmation: '12121212asas12121212a',
                      email: 'me@google.com', email_confirmation: 'me@google.com' }

      post :create_account, test_params
    end
  end

end
