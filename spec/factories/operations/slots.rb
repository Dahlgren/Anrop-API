FactoryBot.define do
  factory :slot, class: Operations::Slot  do
    sequence(:name) { |n| "Slot_#{n}" }
    locked { false }
    association :group, factory: :group
  end
end
