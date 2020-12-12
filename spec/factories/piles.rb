# <<<<<<< HEAD
# FactoryBot.define do
#   factory :pile do
#     name { "kevin's Hand" }
#     creator {"kevin"}
#     private_pile {true}
#     room_id {1}
#   end
# =======
FactoryBot.define do
  factory :pile do
    name { 'Deck' }
    creator { 'Testing User' }
    private_pile { false }
    card_count {52}
    room_id {1}
  end
# >>>>>>> master
end