FactoryGirl.define do
  factory :operation do
    sequence(:title) { |n| "Operation_#{n}" }
    text 'Awesome Operation'
    start { DateTime.now }
    hidden false
    locked false
    association :author, factory: :user
  end
end
