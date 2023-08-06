require 'rails_helper'
require 'pry'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品出品ができる場合' do
      it "product_name,description,category_id,condition_id,shipping_cost_burden_id,prefecture_id,shipping_day_id,price,user,imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it "imageがなければ登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "product_nameがなければ登録できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "descriptionがなければ登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "categoryがなければ登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが12以上では登録できない" do
        @item.category_id = 12
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idがなければ登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idが1では登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idが8以上では登録できない" do
        @item.condition_id = 8
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_cost_burden_idがなければ登録できない" do
        @item.shipping_cost_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost burden can't be blank")
      end
      it "shipping_cost_burden_idが1では登録できない" do
        @item.shipping_cost_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost burden can't be blank")
      end
      it "shipping_cost_burden_idが4以上では登録できない" do
        @item.shipping_cost_burden_id = 4
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost burden can't be blank")
      end
      it "prefecture_idがなければ登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが49以上では登録できない" do
        @item.prefecture_id = 49
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_day_idがなければ登録できない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "shipping_day_idが1では登録できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "shipping_day_idが5以上では登録できない" do
        @item.shipping_day_id = 5
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "priceがなければ登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10000000以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceは数字でなければ登録できない" do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceは全角では登録できない" do
        @item.price = "５００"
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
  
  #binding.pry
  #bundle exec rspec spec/models/item_spec.rb
  #@item.errors.full_messages

