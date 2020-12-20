class User < ApplicationRecord
  has_many :events, through: :members
  has_many :comments, dependent: :destroy
  has_many :members
  has_many :records, dependent: :destroy
  has_many :informations, dependent: :destroy
  has_many :favorites
  has_many :favorite_informations, through: :favorites, source: :information 
 
  has_one :profile, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :user_name, presence: true
end
