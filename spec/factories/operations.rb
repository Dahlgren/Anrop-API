FactoryGirl.define do
  factory :operation do
    sequence(:operation_title) { |n| "Operation_#{n}" }
    operation_text 'Awesome Operation'
    operation_datetime { DateTime.now }
    operation_hidden false
    operation_updated_at { DateTime.now }
    association :author, factory: :user
  end
end
