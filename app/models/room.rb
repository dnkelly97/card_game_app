class Room < ActiveRecord::Base
  has_many :users
  has_many :piles
  #TODO: Add validations to handle invalid or empty inputs
  def self.create_room!(room_params)
    room_params[:room_code] = SecureRandom.random_number(9999999999)
    Room.create!(room_params)
  end
end
