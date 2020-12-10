require 'rails_helper'
require 'spec_helper'

describe PilesController do
  describe 'transferring cards from piles' do
    it 'should redirect to the game room page' do
      # allow(Pile).to receive(:new)
      # post :create, {:name => 'Deck', :creator => 'Gabe', :private_pile => true}
      # expect(response).to redirect_to(room_path)
    end
  end
  describe 'creating a new pile' do
    it 'Should create a new pile if provided valid info' do
      test_params = { pile: { name: 'gabes hand', creator: "gabe", private_pile: true, card_count: 0, room_id: 1 } }
      post :create, params: test_params
      expect(response.status).to eq(302)
      expect(flash[:notice]).to be_present #include?('Your account was successfully created.')).to be_truthy
    end
  end
end
