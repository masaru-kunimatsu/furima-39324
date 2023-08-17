class PurchaseRecordController < ApplicationController

  def index
  end

  def new
    @purchase_address = Purchaseaddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture, :city, :block_number, :building_name, :telephone_number, :purchase_record_id, :item_id).merge(user_id: current_user.id)
  end

end