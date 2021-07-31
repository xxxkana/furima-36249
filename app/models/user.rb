class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  with_options presence: true do
     validates :nickname, :family_name, :first_name,:family_name_reading, :first_name_reading, :datetime
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
     validates :family_name, :first_name
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
    validates :family_name_reading, :first_name_reading
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX 

end
