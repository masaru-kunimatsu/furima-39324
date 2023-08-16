class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block_number, :building, :telephone_number, :purchase_record

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 48, message: "can't be blank"} 
    validates :city 
    validates :block_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/}
  end

  def save
    purchase_record = Purchase_record.create(user_id: user_id, item_id: item_id)
    Shipping_adress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end