class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, length: { maximum: 100 }
  validates :dojo, length: { maximum: 50 }
  has_one_attached :photo
  validate :photo_type, :photo_size

  private

  def photo_type
    if !photo.blob.content_type.in?(%('image/jpeg image/png'))
      errors.add(:photo, 'はjpegまたはpng形式でアップロードしてください')
    end
  end

  def photo_size
    if photo.blob.byte_size > 5.megabytes
      errors.add(:photo, "は1つのファイル5MB以内にしてください")
    end
  end
end
