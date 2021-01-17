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

5.times do |n|
  name = Faker::Name.name
  date  = Faker::Date.between(from: '1985-1-1', to: '2000-12-31')
  prefectures = ["福岡","佐賀","長崎","大分","熊本","宮崎","鹿児島","沖縄"]
  prefecture = prefectures.sample
  user = User.create!(
    user_name: name,
    email: "sample#{n}@email.com",
    password: "password",
    password_confirmation: "password",
    admin: false)
  user.build_profile(
    name: user.user_name,
    image: File.open("./app/assets/images/test#{n}.jpg"),
    grade: "4段",
    birthday: date,
    prefecture: "#{prefecture}県",
    dojo: "#{prefecture}道場",
    description: "#{prefecture}出身の剣道大好き野郎です！よろしく！")
  user.save
end


10.times do
  date  = Faker::Date.between(from: '2021-2-1', to: '2021-12-31')
  m = rand(0..8)
  start_times = ["10:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00"]
  start_time = start_times[m]
  finish_times = ["12:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00"]
  finish_time = finish_times[m]
  places = ["日本武道館","東京武道館","講道館","両国国技館","代々木第一体育館"]
  addresses = ["東京都千代田区北の丸公園2-3","東京都足立区綾瀬3丁目20-1","東京都文京区春日1丁目16-30","東京都墨田区横網1丁目3番28号","東京都渋谷区神南2丁目1-1"]
  latitudes =  [ 35.6933838, 35.7656856, 35.707664, 35.6970304, 35.6676421]
  longitudes = [ 139.7498689, 139.8257265, 139.7534232, 139.7934566, 139.700141]
  n = rand(0..4)
  place = places[n]
  address = addresses[n]
  latitude = latitudes[n]
  longitude = longitudes[n]
  estimate_people = rand(4..20)
  level = rand(0..5)
  user_id = rand(1..5)
  Event.create!(event_day: date,
                start_time: start_time,
                finish_time: finish_time,
                prefecture: 13,
                place: place,
                address: address,
                latitude: latitude ,
                longitude: longitude,
                estimate_people: estimate_people ,
                level: level ,
                comment: "#{place}で楽しくやりましょう！",
                user_id: user_id )
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