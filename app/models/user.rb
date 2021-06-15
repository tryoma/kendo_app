class User < ApplicationRecord
  has_many :events, dependent: :destroy
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

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_name = "ゲストユーザー"
      profile = user.build_profile(name: user.user_name,
                                   grade: "4段",
                                   birthday: '1985-1-1',
                                   prefecture: "佐賀県",
                                   dojo: "ゲスト道場",
                                   description: "佐賀県出身のゲストです！よろしく！")
      profile.photo.attach(io: File.open(Rails.root.join("./app/assets/images/test1.jpg")), filename: "test1.jpg")
    end
  end
end
