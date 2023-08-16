class PurchaseRecord < ApplicationRecord
  belongs_to :user
  has_one :item
  has_one :shipping_adress
end
