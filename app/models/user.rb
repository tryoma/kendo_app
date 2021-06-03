class User < ApplicationRecord
  has_many :events, through: :members
  has_many :members
  has_many :comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :informations, dependent: :destroy
  has_many :favorites
  has_many :favorite_informations, through: :favorites, source: :information 
  has_one :profile, dependent: :destroy
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  validates :user_name, presence: true
  
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower

  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
