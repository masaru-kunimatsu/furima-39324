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
  validates :category_id , presence: true, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 11, message: "can't be blank"} 
  validates :condition_id, presence: true, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 7, message: "can't be blank"} 
  validates :shipping_cost_burden_id, presence: true, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 3, message: "can't be blank"} 
  validates :prefecture_id, presence: true, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 48, message: "can't be blank"} 
  validates :shipping_day_id, presence: true, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 4, message: "can't be blank"} 
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
end