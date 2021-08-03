class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :prefecture, :shipment_day

  with_options presence: true do
    validates :image, :price,:category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id
 end

 with_options presence: true do
  validates :name, length: {maximum: 40}
 end

 with_options presence: true do
  validates :comments, length: {maximum: 1000}
 end

  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id, numericality: { other_than: 1, message: "can't be blank"} 

  validates :price, numericality: {greater_than: 300, less_than: 99999999}, format: {with: /\A[0-9]+\z/}
end
