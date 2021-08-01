class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :prefecture, :shipment_day

  with_options presence: true do
    validates :name, :comments, :price,:category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id
 end

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id, numericality: { other_than: 1, message: "can't be blank"} 

end
