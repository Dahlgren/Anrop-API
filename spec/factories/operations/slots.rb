FactoryGirl.define do
  factory :slot, class: Operations::Slot  do
    sequence(:name) { |n| "Slot_#{n}" }
    association :group, factory: :group
  end
end
