FactoryBot.define do
  factory :pile do
    name { 'Deck' }
    creator { 'The Game' }
    private_pile { false }
    card_count {52}
    room_id {1}
  end

end