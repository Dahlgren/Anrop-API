FactoryBot.define do
  factory :addon, class: Operations::Addon  do
    sequence(:name) { |n| "Addon_#{n}" }
    sequence(:url) { |n| "Addon_Url_#{n}" }
    association :operation, factory: :operation
  end
end
