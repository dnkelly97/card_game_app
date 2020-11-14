require 'rails_helper'
require 'spec_helper'

describe PilesController do
  describe 'transferring cards from piles' do
    it 'should redirect to piles home page if source pile is invalid' do
      params = {
          pile: {source_pile: nil}
      }
      post :show, params: params
      expect(response).to redirect_to (piles_pile_homepage_path)
    end
    it 'should render the show page for the source pile' do
      Pile.create(:name => "Deck", :private_pile => true)
      params = {
          pile: {source_pile: "Deck"}
      }
      post :show, params: params
      expect(response).to render_template('show')
    end
  end
end