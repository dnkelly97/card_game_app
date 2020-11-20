require 'rails_helper'

RSpec.describe UserSessionsController do
  describe 'Login to account' do
    before(:all) do
      User.delete_all
      @user = FactoryBot.create(:user)
    end
    it 'Should go to dashboard if provided valid info' do
      # Valid
      test_params = { user: { password: 'testpass1',
                              email: 'me@you.com' } }
      post :create, params: test_params
      expect(response).to redirect_to(dashboard_path)
      expect(flash[:notice].include?("#{assigns(:current_user).user_id}")).to be_truthy
      expect(flash[:notice].include?('Your account was successfully logged in.')).to be_truthy
    end
    it 'Should go to login if provided invalid info' do
      # Invalid
      test_params = { user: { password: 'testpass0',
                              email: 'me@you.com' } }
      post :create, params: test_params
      expect(response).to redirect_to(login_path)
      expect(flash[:warning]).to match('Unsuccessful login')

    end
    it 'Should go to login page if logging out' do
      # Valid
      test_params = { user: { password: 'testpass1',
                              email: 'me@you.com' } }
      post :create, params: test_params
      expect(session[:session_token]).to_not be_nil
      post :destroy
      expect(session[:session_token]).to be_nil

    end
    it 'Dashboard after login has current_user' do
      # Valid
      test_params = { user: { password: 'testpass1',
                              email: 'me@you.com' } }
      post :create, params: test_params
      post :index
      expect(assigns(:current_user)).to_not be_nil

    end
  end

end
