class Pile < ActiveRecord::Base
  has_many :cards
  belongs_to :room
  after_update :signal_pile_change

  def signal_pile_change
    LobbyUpdateJob.perform_later(self.room_id, self.id)
  end
end
