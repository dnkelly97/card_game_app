require 'spec_helper'
require 'rails_helper'

describe Room do
  describe 'creating a new room' do
    describe 'with valid attributes' do
      before(:each) do
        expect(SecureRandom).to receive(:random_number).and_return(1234567890)
        fake_data = {:name => 'Test', :max_players => 5, :game_type => 'Random', :private => true }
        Room.create_room!(fake_data)
        @room = Room.find_by_name('Test')
      end
      it 'should generate a room code' do
        expect(@room.room_code).to eq("1234567890")
      end
      it 'should assign the right number of players' do
        expect(@room.max_players).to eq(5)
      end
      it 'should properly assign game type' do
        expect(@room.game_type).to eq("Random")
      end
      it 'should properly make private room' do
        expect(@room.private).to eq(true)
      end

    end

    pending it 'should handle an empty player number input'
    pending it 'should handle an invalid player number input'
    pending it 'should handle an empty string for game type'
  end
end
