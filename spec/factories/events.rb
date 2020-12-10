FactoryBot.define do
  factory :event do
    event_day "2020-12-05"
    start_time "2020-11-30 13:18:00"
    finish_time "2020-11-30 14:18:00"
    prefecture "東京都"
    place "日本武道館"
    estimate_people 3
    level 3
    comment "issyoni"
    association :owner
  end
end
