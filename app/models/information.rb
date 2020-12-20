class Information < ApplicationRecord
  belongs_to :user
  has_many :favorites

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 200 }
  validates :until, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
