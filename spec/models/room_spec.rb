require 'spec_helper'
require 'rails_helper'

describe Room do
  describe 'creating a new room' do
    it 'should generate a room code' do
      expect(SecureRandom).to receive(:random_number).and_return(1234567890)
      fake_data = {:name => 'Test', :max_players => 5, :game_type => 'Random', :private => false }
      Room.create_room!(fake_data)
      room = Room.find_by_name('Test')
      expect(room.room_code).to eq("1234567890")
    end
    pending it 'should assign the right number of players'
    pending it 'should handle an empty player number input'
    pending it 'should handle an invalid player number input'
    pending it 'should handle an empty string for game type'
    pending it 'should properly assign game type'
    pending it 'should properly assign private settings'
  end
end
