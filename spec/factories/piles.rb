FactoryBot.define do
  factory :pile do
    name { 'Deck' }
    creator { 'Testing User' }
    private_pile { false }
    card_count {52}
    room_id {1}
  end
end