require 'rails_helper'

RSpec.describe BuyShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipping_address = FactoryBot.build(:buy_shipping_address, item_id: item.id, user_id: user.id)
    sleep(1)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@buy_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_shipping_address.building = ''
        expect(@buy_shipping_address).to be_valid
      end
      it 'priceとtokenがあれば保存ができること' do
        expect(@buy_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @buy_shipping_address.postal_code = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @buy_shipping_address.postal_code = '1234567'
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeは全角だと保存できない' do
        @buy_shipping_address.postal_code = '１２３'
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefectureが未選択だと保存できない' do
        @buy_shipping_address.prefecture_id = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが0だと保存できない' do
        @buy_shipping_address.prefecture_id = 0
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @buy_shipping_address.city = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @buy_shipping_address.house_number = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @buy_shipping_address.phone_number = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは９桁以内だと保存できない' do
        @buy_shipping_address.phone_number = '111111111'
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberは12桁以上だと保存できない' do
        @buy_shipping_address.phone_number = '222222222222'
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberは全角数値だと保存できない' do
        @buy_shipping_address.phone_number = '１２３４５６７８９１０'
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberはハイフンを含むと保存できない' do
        @buy_shipping_address.phone_number = '111-2222'
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'buy_shipping_addressとuserが紐ずいていないと保存できない' do
        @buy_shipping_address.user_id = nil
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'buy_shipping_addressとitemが紐ずいていないと保存できない' do
        @buy_shipping_address.item_id = nil
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @buy_shipping_address.token = nil
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end