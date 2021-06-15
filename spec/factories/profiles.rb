FactoryBot.define do
  factory :profile do
    name { '大城戸功' }
    description { '剣道大好き野郎です！' }
    dojo { '厳武道' }
    association :user
  end
end
