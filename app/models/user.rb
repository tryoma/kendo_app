class User < ApplicationRecord
  has_many :events, through: :members
  has_many :members
  has_many :comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :informations, dependent: :destroy
  has_many :favorites
  has_many :favorite_informations, through: :favorites, source: :information
  has_one :profile, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :user_name, presence: true

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
