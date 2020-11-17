require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  context '商品購入がうまくいくとき' do
    it 'token,postal_code,prefecture_id,city,house_number,building_name,phone_numberがすべてあれば登録できること' do
      expect(@purchase_address).to be_valid
    end
    it 'building_nameがなくても登録できる' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end
  end
  context '商品購入がうまくいかないとき' do
    it 'tokenが空だと登録できない' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it 'postal_codeが空だと登録できない' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'postal_codeが数字だけでは登録できない' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("郵便番号は不正な値です")
    end
    it 'prefecture_idが空だと登録できない' do
      @purchase_address.prefecture_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
    end
    it 'cityが空だと登録できない' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'house_numberが空だと登録できなし' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("建物名を入力してください")
    end
    it 'phone_numberが空だと登録できない' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'phone_numberに「-」があると登録できない' do
      @purchase_address.phone_number = '123-456-789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号は数値で入力してください")
    end
    it 'phone_numberが12文字以上だと登録できない' do
      @purchase_address.phone_number = '0123456789012'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end
  end
end
