class Information < ApplicationRecord
  belongs_to :user
  has_many :favorites

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 200 }
  validates :limited, presence: true
  validates :youtube_url, allow_blank: true,
  format: { with: /\A(https\:\/\/)?(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)+[\S]{11}\z/ }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
