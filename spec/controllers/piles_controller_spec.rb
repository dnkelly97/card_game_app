require 'rails_helper'
require 'spec_helper'

describe PilesController do
  describe 'transferring cards between piles' do
    before(:all) do
      @room = Room.create_room! name: "Dan's Test Room", max_players: 2, game_type: "ultra fun", private: true
      User.delete_all
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user, :user_id => "don_quijote", :email => 'you@you.com', :email_confirmation => 'you@you.com')
      @room.users << [@user, @user2]
      @room.save
      @pile1 = Pile.create! name: 'pile1', creator: @user.user_id, private_pile: true, card_count: 2
      @pile2 = Pile.create! name: 'pile2', creator: @user2.user_id, private_pile: true, card_count: 1
      @room.piles << [@pile1, @pile2]
      Card.create([{name: "Ace of Spades", pile_id: @pile1.id, unicode_value: "1F0A1"},
                            {name: "Two of Spades", pile_id: @pile1.id, unicode_value: "1F0A2"},
                            {name: "Three of Spades", pile_id: @pile2.id, unicode_value: "1F0A3"}])
    end
    after(:all) do
      Room.delete_all
      User.delete_all
      Card.delete_all
    end
    it 'should redirect to game room page if destination pile not selected' do
      post :transfer_card, params: {room_id: @room.id, pile: {source_pile_id: @pile1.id, destination_pile_id: ""}},
           session: {session_token: @user.session_token}
      expect(response).to redirect_to(room_path({:id => @room.id}))
    end
    it 'should redirect to game room page if source pile not selected' do

    end
    it 'should redirect to the game room page if no cards were selected for transfer' do

    end
    it 'should transfer cards from source pile to destination pile' do

    end
    it 'should change the card counts of the source and destination piles' do

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
