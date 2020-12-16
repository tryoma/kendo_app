class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :informations, dependent: :destroy
  has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :user_name, presence: true
end
