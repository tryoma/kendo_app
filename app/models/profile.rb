class Profile < ApplicationRecord
  belongs_to :user
  validates :description, length: { maximum: 100 }
  validates :dojo, length: { maximum: 50 }

  mount_uploader :avatar, ProfileAvatarUploader
end
