FactoryBot.define do
  factory :event do
    event_day "2021-12-05"
    start_time "2021-11-30 13:18:00"
    finish_time "2021-11-30 14:18:00"
    prefecture "千葉県"
    place "ディズニーランド"
    address "千葉県浦安市舞浜"
    latitude 35.6308022
    longitude 139.8828549
    estimate_people 3
    level 3
    comment "ミッキーと一緒に稽古しよう！"
    association :owner
  end
end
