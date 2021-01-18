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

Information.create!(title: "剣道選手権大会結果",
                    body: "決勝は國友錬太朗(福岡・警察)と松﨑賢士郎(茨城・筑波大3年)が対戦し、両選手とも互角の展開で延長戦となり、最後は國友が鋭く攻めてコテを決め優勝を果たした。國友は第62回大会、第64回大会で決勝へ進出も日本一には手が届かず、三度目の正直で悲願の天皇杯を手にした。",
                    limited: '2021-12-31',
                    youtube:"RWImBV6NYt8",
                    user_id: 1 )

Information.create!(title: "勉強になります！",
                    body: "結構前の動画になりますけど、剣道一本集です。高校生と思えない感じです。見ていて気持ちよくストレス発散にもなりますよ！",
                    limited: '2021-12-31',
                    youtube:"21DG9jt_Yks",
                    user_id: 2 )

Information.create!(title: "さすが高段者は違います。",
                    body: "八段の先生方はやはり格が違いますね。。。お年は召しておられるのになんであんな動きができるんでしょう。私は４段ですが、こんな動きは出来ません。さすがとしか言えません。。。",
                    limited: '2021-12-31',
                    youtube:"c1yK8kxliBM",
                    user_id: 3 )

Information.create!(title: "ミライモンスター",
                    body: "全国大会で3年負けなしの高校剣道会最強高校・九州学院高等学校剣道部主将。全国大会13連覇を目指し残る玉竜旗とインターハイ制覇を目指すが、今年熊本地震発生。学校は閉鎖、剣道部も休部。そのなか大会に挑む。というタイトルで梶谷さんが特集されてます。面白かったですよ。",
                    limited: '2021-12-31',
                    youtube:"2bCiIb4I6ac",
                    user_id: 4 )

Information.create!(title: "炎の体育会TV",
                    body: "体育会TV剣道部ファンの皆さんお待たせしました！
                    今回の２時間SPでは、体育会剣道部が･･･フランスの美女剣士と対決！さらに･･･渡辺リーダーの応援に泉ピン子さんが来てくれました☆体育会TV初の外国人剣士との対決は、土曜よる７時からの体育会TVで☆",
                    limited: '2021-12-31',
                    youtube:"6P-O8C_tXWo",
                    user_id: 1 )
  
Information.create!(title: "大園桃子上手い",
                    body: "「スイカ割り剣道」では高山一実vs大園桃子の剣道経験者同士の対決がとても見応えがありましたし、バナナマン・日村を剣でシバいたり途中で転んじゃったりした山下美月からは“アイドルバラエティを全うする意志”が感じられて「さすがだな」と唸りました。",
                    limited: '2021-12-31',
                    youtube:"CVMyivsvvqE",
                    user_id: 1 )


4.times do |n|
  date  = Faker::Date.between(from: '2020-12-25', to: '2021-12-25')
  title = "投稿します!#{n}" 
  content = "#{n}回稽古しました"
  Record.create!(start_time: date,
                 title: title,
                 content: content,
                 user_id: 1 )
end