class User < ApplicationRecord
  has_many :events, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :user_name, presence: true
end
