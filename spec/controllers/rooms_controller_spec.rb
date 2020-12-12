require 'spec_helper'
require 'rails_helper'

describe RoomsController do
  before(:all) do
    User.delete_all
    @user = FactoryBot.create(:user)
  end

  describe 'creating a new room' do
    it 'should successfully create a new room' do
      post :create, params: {room_name: 'Test', max_players: 5, game_type: 'Random', private: false },
          session: {session_token: @user.session_token}
      expect(flash[:notice].include?('Welcome to your newly created room')).to be_truthy
      expect(Room.all.count).to eq(1)
      expect(Room.find(1).name).to eq('Test')
    end
    it 'should redirect to the new created room' do
      post :create, params: {room_name: 'Test'}, session: {session_token: @user.session_token}
      expect(response).to redirect_to('/rooms/1')
      #TODO: Figure out how to change to a path variable
    end
    it 'should go back to login page if not logged in' do
      post :create, params: {room_name: 'Test'}
      # byebug
      expect(response).to redirect_to(dashboard_path)
    end
  end
  describe 'joining a new room' do
    before(:each) do
      allow(SecureRandom).to receive(:random_number).and_return(1111111111)
      post :create, params: {room_name: "Dan's Test Room"}, session: {session_token: @user.session_token}
    end
    it 'should redirect to the room page corresponding to the valid id given' do

      post :create_join, params: {id: 1111111111}
      # byebug
      expect(response).to redirect_to('/rooms/1')
    end
    it 'should redirect to the join room page if invalid id is given' do
      post :create_join, params: {id: 1111111110}
      # byebug
      expect(response).to redirect_to('/rooms/new_join')
    end
    it 'should flash a warning if an invalid id is given' do
      post :create_join, params: {id: 1111111110}
      # byebug
      expect(flash[:warning]).to eq("A room with that code does not exist.")
    end

  end

  describe 'Show Action' do
    before(:each) do
      @room = FactoryBot.create(:room)
      @pile = FactoryBot.create(:pile)
      get :show, params: {id: 1}, session: {session_token: @user.session_token}
    end
    it 'should set the @room variable to the Room with the id 1' do
      assigns(:room).should eq(Room.find(1))
    end
    it 'should the render the show view' do
      expect(response).to render_template(:show)
    end
  end

  describe 'Showing a Hand' do
    before(:each) do
      @room = FactoryBot.create(:room)
      @pile = FactoryBot.create(:pile)
      post :show_hand, xhr: true, session: {session_token: @user.session_token}
    end
    it 'should update the piles table\'s private_pile boolean value' do
      expect(Pile.find(1).private_pile).to eq(false)
    end
    it 'should render the partial hide_hand' do
      expect(response).to render_template(partial: '_hide_hand')
    end
    it 'should render the partial show_hand' do
      post :show_hand, xhr: true, session: {session_token: @user.session_token}
      expect(response).to render_template(partial: '_show_hand')
    end
  end
end
