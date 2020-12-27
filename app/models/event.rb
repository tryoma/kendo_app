class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :members
  has_many :users, through: :members
  has_many :comments, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :event_day, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :prefecture, presence: true
  validates :place, presence: true
  validates :estimate_people, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 100}
  validates :level, presence: true
  validates :comment, presence: true, length: { maximum: 100 }

  validate :date_before_start
  validate :finish_time_before_start_time
    
    def date_before_start
      return if event_day.blank?
      errors.add(:event_day, "は今日以降の稽古日にしてください") if event_day < Date.today
    end

    def finish_time_before_start_time
      return if start_time.blank? || finish_time.blank?
      errors.add(:finish_time, "は開始時間以降のにしてください") if finish_time < start_time
    end
  
  
  enum prefecture:{
    未設定:0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
    沖縄県:47,海外:48
  },_suffix: true   
  
  enum level: {
     "未設定": 0, 
     "だれでもOK": 1, 
     "初級：初心者〜初段": 2, 
     "中級：２段〜４段": 3, 
     "上級：５段〜６段": 4, 
     "最上級：７段〜": 5
  },_suffix: true

end
