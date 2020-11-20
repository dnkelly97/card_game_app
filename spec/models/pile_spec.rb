require 'spec_helper'
require 'rails_helper'

describe Pile do
  describe 'creating a new pile' do
      before(:each) do
        fake_data = {:name => "test pile", :creator => "Gabriel", :private_pile => true, :card_count => 0}
        Pile.create!(fake_data)
        @pile = Pile.find_by_name('test pile')
      end
      it 'should have its card count initialized to 0' do
        expect(@pile).to have_attributes(:card_count => 0)
      end
  end
end

