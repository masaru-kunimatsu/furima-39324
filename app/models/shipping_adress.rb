class ShippingAdress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :purchase_record

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, presence: true, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 48, message: "can't be blank"} 
  validates :city , presence: true
  validates :block_number, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/}
end
