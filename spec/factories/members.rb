FactoryBot.define do
  factory :member do
    first_agree { false }
    second_agree { false }
    association :user
    association :event
  end
end
