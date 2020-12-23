user = User.create!(user_name: "Sample User",
  email: "sample@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)

user.build_profile
user.profile.name = user.user_name
user.save


user = User.create!(user_name: "Sample User1",
  email: "sample1@email.com",
  password: "password",
  password_confirmation: "password",
  admin: false)

user.build_profile
user.profile.name = user.user_name
user.save


# 4.times do
#   date  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
#   Event.create!(event_day: date,
#                 start_time: "11:00",
#                 finish_time: "12:00",
#                 prefecture: "千葉県",
#                 place: "ディズニーランド",
#                 address: "千葉県浦安市舞浜",
#                 latitude: "35.6308022",
#                 longitude: "139.8828549",
#                 estimate_people: "5",
#                 level: "10",
#                 comment: "ミッキーと一緒に稽古しよう！",
#                 user_id: 2 )
# end

4.times do |n|
  date  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
  title = "お役たち情報#{n}" 
  body = "#{n}号店オープン！"
  date2  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
  Information.create!(title: title,
                      body: body,
                      until: date2,
                      user_id: 1 )
end