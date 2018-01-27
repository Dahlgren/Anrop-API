FactoryBot.define do
  factory :aar, class: Operations::Aar  do
    sequence(:aar_id)
    association :operation, factory: :operation
  end
end
