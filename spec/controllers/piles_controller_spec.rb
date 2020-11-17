require 'rails_helper'
require 'spec_helper'

describe PilesController do
  describe 'transferring cards from piles' do
    it 'should render the show page for the source pile' do
      Pile.create(:name => "Deck", :private_pile => true)
      params = {
          pile: {source_pile: "Deck"}
      }
      post :show, params
      expect(response).to render_template('show')
    end
  end
end
