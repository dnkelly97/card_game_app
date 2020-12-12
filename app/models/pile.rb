class Pile < ActiveRecord::Base
  has_many :cards
  belongs_to :room
  after_update :signal_pile_change

  def signal_pile_change
    LobbyUpdateJob.perform_later(self.room_id, self.id)
  end

  def self.transfer(source_pile, destination_pile, cards)
    card_difference = cards.keys.count
    destination_pile[:card_count] = destination_pile.cards.count + card_difference
    source_pile[:card_count] = source_pile.cards.count - card_difference
    destination_pile.save
    source_pile.save
    cards.keys.each do |card|
      destination_pile.cards << Card.find_by(id: card)
    end
  end
end
