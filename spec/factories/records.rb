FactoryBot.define do
  factory :record do
    start_time "2021-12-05"
    title "稽古納めやりました"
    content "今年最後の稽古。しっかりと竹刀を振り切れた"
    association :user
  end
end
