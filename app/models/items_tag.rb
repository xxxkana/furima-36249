class ItemsTag

  include ActiveModel::Model
  attr_accessor :tag_name, :image, :name, :comments, :price,:category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id, :user_id

  with_options presence: true do
    validates :image, :name, :comments, :price
    validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id, numericality: { other_than: 1, message: "を選択してください"}
    validates :tag_name, length: {maximum: 40}
  end

  def save
    item = Item.create(image: image, name:name, comments:comments, price:price, category_id:category_id, condition_id:condition_id, delivery_fee_id:delivery_fee_id, prefecture_id:prefecture_id, shipment_day_id:shipment_day_id, user_id:user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)

  end

end
