class Record < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 100 }
  validates :content, length: { maximum: 400 }
  validates :worked_on, presence: true

end
