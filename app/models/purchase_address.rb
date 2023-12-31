class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block_number, :building, :telephone_number, :purchase_record, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 48, message: "can't be blank"} 
    validates :city 
    validates :block_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/}
    validates :token, presence: true
  end

  def save
    @purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAdress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building: building, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end