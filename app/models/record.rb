class Record < ApplicationRecord
  belongs_to :user
  validates :diary, length: { maximum: 300 }
end
