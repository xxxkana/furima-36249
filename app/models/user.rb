class User < ApplicationRecord

  has_many :items
  has_many :user_items

  validates :email,               presence: true
  validates :nickname,            presence: true
  validates :family_name,         presence: true
  validates :first_name,          presence: true
  validates :family_name_reading, presence: true
  validates :first_name_reading,  presence: true
  validates :datetime,            presence: true


end
