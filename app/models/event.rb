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
  validates :latitude, presence: true, allow_blank: true
  validates :longitude, presence: true, allow_blank: true
  validates :estimate_people, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 100}
  validates :level, presence: true, numericality: {only_integer: true}
  validates :comment, presence: true, length: { maximum: 100 }
end
