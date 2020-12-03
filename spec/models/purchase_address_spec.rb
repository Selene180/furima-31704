require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: buyer.id, item_id: item.id)
  end

  describe '商品の購入' do
    context '購入した商品の情報が保存できる場合' do
      it '郵便番号と都道府県、市区町村と番地、電話番号とtokenがあれば保存される' do
        expect(@purchase_address).to be_valid
      end
    end
    context '購入した商品の情報が保存できない場合' do
      it '郵便番号がないと商品の情報は保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと商品の情報は保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Please write a hyphen in the zip code')
      end

      it '都道府県がないと商品の情報は保存できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村がないと商品の情報は保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと商品の情報は保存できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号がないと商品の情報は保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内でないと商品の情報は保存できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Please enter within 11 digits')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idがないと登録できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがないと登録できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
