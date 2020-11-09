require 'rails_helper'

RSpec.describe "UserSessions", type: :request do
  describe 'Creating a New Account' do
    before(:all) do
      expect(User).to receive(:create!)
    end
    it 'Should create a new account if provided valid info' do
      # Valid
      test_params = { user: { password: 'asdf123',
                              email: 'me@google.com' } }
      post :create, test_params
      expect(response).to redirect_to(login_path)
    end
  end

end
