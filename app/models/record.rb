class Record < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 400 }, presence: true
  validates :start_time, presence: true
end
