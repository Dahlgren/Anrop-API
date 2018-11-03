FactoryBot.define do
  factory :operation, class: Operations::Operation  do
    sequence(:title) { |n| "Operation_#{n}" }
    text { 'Awesome Operation' }
    start { DateTime.now }
    hidden { false }
    locked { false }
    association :author, factory: :user
  end
end
