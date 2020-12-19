class Record < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 100 }
  validates :content, length: { maximum: 400 }
  validates :start_time, presence: true

end
