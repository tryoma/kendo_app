class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, length: { maximum: 100 }
  validates :dojo, length: { maximum: 50 }

  mount_uploader :avatar, AvatarUploader
end
