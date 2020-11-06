require 'spec_helper'
require 'rails_helper'

describe RoomsController do
  describe 'creating a new room' do
    it 'should successfully create a new room' do
      post :create, {:room_name => 'Test'}
      expect(Room.all.count).to eq(1)
      expect(Room.find(1).name).to eq('Test')
    end
    it 'should redirect to the new created room' do
      post :create, {:room_name => 'Test'}
      expect(response).to redirect_to('/rooms/1')
      #TODO: Figure out how to change to a path variable
    end
    pending it 'should generate a room code'
  end
end
