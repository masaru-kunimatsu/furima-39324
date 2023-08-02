class ItemsController < ApplicationController

  def index
  end
  
  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :shipping_cost_burden_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end


