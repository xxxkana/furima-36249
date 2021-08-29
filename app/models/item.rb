class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipment_day

  belongs_to :user
  has_one_attached :image
  has_one :user_item

  has_many :messages, dependent: :destroy
  
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations

  def self.search(search)
    if search != ""
      tag = Tag.where('tag_name LIKE(?)', "%#{search}%")
      item = tag[0].items
      return item
    else
      Item.all
    end
  end

  with_options presence: true do
    validates :image, :price,:category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id
    validates :name, length: {maximum: 40}
    validates :comments, length: {maximum: 1000}
 end

  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_day_id, numericality: { other_than: 1, message: "を選択してください"} 

  validates :price, numericality: {greater_than: 299, less_than: 10000000}, format: {with: /\A[0-9]+\z/}
end
