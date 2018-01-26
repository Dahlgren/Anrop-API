FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "User_#{n}" }
    user_email { "#{user_name}@anrop.se".downcase }

    # Authentication
    user_password ''
    user_salt ''
    user_admin_password ''
    user_admin_salt ''

    user_groups ''
    user_rights ''

    # Read threads
    user_threads ''

    # User data
    user_birthdate { Date.today }
    user_sig ''

    trait :operation_maker do
      user_groups '.7'
    end
  end
end
