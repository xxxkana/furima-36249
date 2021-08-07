class AddressUserItem
  include ActiveModel::Model
  attr_accessor :postal_code, :postal_code, :city, :house_number, :building_number, :phone_number, :user_id, :item_id

  # ここにバリデーションの処理を書く

  with_options presence: true do
  validates :user_item_id, :city, :house_number
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number,format: {with: /\A\d{10,11}\z/, message: "is invalid"}
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  end

  with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is cann't blank"} do
    validates :city, :house_number, :building_number
  end

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, user_item_id: user_item.id)
  end
end