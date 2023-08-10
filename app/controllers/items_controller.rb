class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_params, only: [:edit, :show ,:update]

  def index
    @items = Item.order(created_at: :desc)
  end
  
  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :shipping_cost_burden_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end


