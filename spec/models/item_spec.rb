require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "出品した商品の情報が保存できる場合" do
      it "商品名と商品の説明、出品画像とカテゴリー、商品の状態と搬送料の負担、発送元の地域と発送までの日数、販売価格があれば保存される" do
        expect(@item).to be_valid
      end
    end
    context "出品した商品の情報が保存できない場合" do
      it "商品名がないと商品の情報は保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
     end 

      it "商品の説明がないと商品の情報は保存できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "商品の詳細でカテゴリーがないと商品の情報は保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の詳細で商品の状態がないと商品の情報は保存できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "搬送についてで搬送料の負担がないと商品の情報は保存できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it "搬送についてで発送元の地域がないと商品の情報は保存できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "搬送についてで発送までの日数がないと商品の情報は保存できない" do
        @item.delivery_time_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it "販売価格がないと商品の情報は保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end