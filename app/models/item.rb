class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost_burden
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one :purchase_record
  has_many_attached :image

  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id , presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :image, attached_file_presence: true
end