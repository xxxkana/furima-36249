class UserItem < ApplicationRecord

belongs_to :user
belongs_to :item
has_one :address
has_many :user_items

end
