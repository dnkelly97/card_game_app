require 'spec_helper'
require 'rails_helper'

describe RoomsController do
  describe 'creating a new room' do
    it 'should successfully create a new room' do
      post :create, params: {:room_name => 'Test', :max_players => 5, :game_type => 'Random', :private => false }
      expect(Room.all.count).to eq(1)
      expect(Room.find(1).name).to eq('Test')
    end
    it 'should redirect to the new created room' do
      post :create, params: {:room_name => 'Test'}
      expect(response).to redirect_to('/rooms/1')
      #TODO: Figure out how to change to a path variable
    end

  end
  describe 'joining a new room' do
    before(:each) do
      allow(SecureRandom).to receive(:random_number).and_return(1111111111)
      post :create, params: {:room_name => "Dan's Test Room"}
    end
    it 'should redirect to the room page corresponding to the valid id given' do

      post :create_join, params: {:id => 1111111111}
      # byebug
      expect(response).to redirect_to('/rooms/1')
    end
    it 'should redirect to the join room page if invalid id is given' do
      post :create_join, params: {:id => 1111111110}
      # byebug
      expect(response).to redirect_to('/rooms/new_join')
    end
    it 'should flash a warning if an invalid id is given' do
      post :create_join, params: {:id => 1111111110}
      # byebug
      expect(flash[:warning]).to eq("A room with that code does not exist.")
    end
  end
end
