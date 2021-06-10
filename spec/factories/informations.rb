FactoryBot.define do
  factory :information do
    title { 'テスト情報' }
    body { 'テストの情報です' }
    limited { '2021-12-05' }
    youtube { '0vB5KgUtwzs' }
    youtube_url { 'https://youtu.be/0vB5KgUtwzs' }
    association :user
  end
end
