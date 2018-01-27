FactoryBot.define do
  factory :steam_workshop, class: Operations::SteamWorkshop  do
    sequence(:steam_workshop_id)
    association :operation, factory: :operation
  end
end
