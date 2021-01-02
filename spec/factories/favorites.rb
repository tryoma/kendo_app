FactoryBot.define do
  factory :favorite do
    association :user
    association :information
  end
end
