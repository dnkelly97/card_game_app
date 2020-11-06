require 'spec_helper'
require 'rails_helper'

describe RoomsController do
  describe 'creating a new room' do
    it 'should successfully create a new room' do
      post :create
      expect(Room.all.count).to eq(1)
    end
    it 'should redirect to the new created room' do
      post :create
      expect(response).to render_template(room_path/1)
    end
    it 'should generate a room code' do

    end
  end
end
