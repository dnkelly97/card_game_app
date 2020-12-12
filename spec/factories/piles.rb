FactoryBot.define do
  factory :pile do
    name { "kevin's Hand" }
    creator {"kevin"}
    private_pile {true}
    room_id {1}
  end
end