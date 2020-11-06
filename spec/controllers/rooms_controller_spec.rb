require 'spec_helper'
require 'rails_helper'

describe RoomsController do
  describe 'creating a new room' do
    it 'should call the method that creates a new room' do
      expect(Room).to receive(:new).and_return("Fake Room")
    end
    it 'should redirect to the new created room' do
      post :create_room
      expect(response).to render_template(room_path)
    end
  end
end
