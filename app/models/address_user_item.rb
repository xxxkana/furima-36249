class AddressUserItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :city, :house_number, :token
  validates :user_id
  validates :item_id
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number,format: {with: /\A\d{10,11}\z/, message: "is invalid"}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  end

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, user_item_id: user_item.id)
  end
end