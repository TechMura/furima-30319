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
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと登録できない' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが数字だけでは登録できない' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefecture_idが空だと登録できない' do
      @purchase_address.prefecture_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと登録できない' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと登録できなし' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと登録できない' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberに「-」があると登録できない' do
      @purchase_address.phone_number = '123-456-789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is not a number')
    end
    it 'phone_numberが12文字以上だと登録できない' do
      @purchase_address.phone_number = '0123456789012'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
  end
end
