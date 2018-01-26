FactoryBot.define do
  factory :group, class: Operations::Group  do
    sequence(:name) { |n| "Group_#{n}" }
    association :operation, factory: :operation
  end
end
