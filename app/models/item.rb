class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost_burden
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id , presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_cost_burden_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/}
  validates :user, presence: true
  validates :image, presence: true
end