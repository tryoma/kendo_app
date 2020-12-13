User.create!(user_name: "Sample User",
  email: "sample@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)

User.create!(user_name: "Sample User1",
  email: "sample1@email.com",
  password: "password",
  password_confirmation: "password",
  admin: false)

4.times do
  date  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
  Event.create!(event_day: date,
                start_time: "11:00",
                finish_time: "12:00",
                prefecture: "千葉県",
                place: "ディズニーランド",
                estimate_people: "5",
                level: "10",
                comment: "ミッキーと一緒に稽古しよう！",
                user_id: 2 )
end

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