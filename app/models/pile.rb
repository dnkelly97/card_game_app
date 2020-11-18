class Pile < ActiveRecord::Base
  has_many :cards
  belongs_to :room
end
