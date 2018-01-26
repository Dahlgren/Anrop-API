FactoryBot.define do
  factory :shout do
    sequence(:message) { |n| "Shout_#{n}" }
    association :user, factory: :user
  end
end
