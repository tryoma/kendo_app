# 管理者ユーザー
user = User.create!(
  user_name: "Sample User",
  email: "sample@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)
user.build_profile
user.profile.name = user.user_name
user.save


user = User.create!(
  user_name: "Sample User1",
  email: "sample1@email.com",
  password: "password",
  password_confirmation: "password",
  admin: false)
user.build_profile(
  name: user.user_name,
  image: File.open('./app/assets/images/test1.jpg'),
  grade: "4段",
  birthday: "1990-12-25",
  prefecture: "佐賀県",
  dojo: "佐賀道場",
  description: "佐賀出身の剣道野郎です！よろしく！")
user.save


4.times do
  date  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
  Event.create!(event_day: date,
                start_time: "11:00",
                finish_time: "12:00",
                prefecture: 0,
                place: "日本武道館",
                address: "東京都千代田区北の丸公園２−３",
                latitude: 35.6933838 ,
                longitude: 139.7498689,
                estimate_people: 10 ,
                level: 3 ,
                comment: "いい会場で楽しくやりましょう！",
                user_id: 1 )
end

4.times do |n|
  date  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
  title = "お役たち情報#{n}" 
  body = "#{n}号店オープン！"
  date2  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
  Information.create!(title: title,
                      body: body,
                      limited: date2,
                      user_id: 1 )
end

4.times do |n|
  date  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
  title = "投稿します!#{n}" 
  content = "#{n}回稽古しました"
  Record.create!(start_time: date,
                 title: title,
                 content: content,
                 user_id: 1 )
end