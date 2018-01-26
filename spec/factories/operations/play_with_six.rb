FactoryBot.define do
  factory :play_with_six, class: Operations::PlayWithSix  do
    sequence(:name) { |n| "PWS_#{n}" }
    association :operation, factory: :operation
  end
end
