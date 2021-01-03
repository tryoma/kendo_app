FactoryBot.define do
  factory :comment do
    body "この会場は飲食可能でしょうか？"
    association :user
    association :event
  end
end
