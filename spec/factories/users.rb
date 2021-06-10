FactoryBot.define do
  factory :user, aliases: [:owner, :follower, :following] do
    user_name { '大城戸功' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    admin { false }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
