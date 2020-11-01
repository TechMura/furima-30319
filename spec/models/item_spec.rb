require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    it 'name,explanation,category_id,status,delivery_payment_id,prefecture_id,shipping_period_id,priceがすべてあれば登録できること' do
      expect(@item).to be_valid
    end
    it 'nameが空なら登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'nameが40文字を超えた場合登録できないこと' do
      @item.name = Faker::Base.regexify('[123nameなまえナマエ名前]{41}')
      @item.valid?
      expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
    end
    it 'explanationが空だと登録でないこと' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'explanationが空だと登録できないこと' do
      @item.explanation = Faker::Base.regexify('[123explanationせつめいセツメイ説明]{1001}')
      @item.valid?
      expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
    end
    it 'category_idが空なら登録できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'status_idが空なら登録できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'delivery_payment_idが空なら登録できないこと' do
      @item.delivery_payment_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery payment can't be blank")
    end
    it 'prefecture_idが空なら登録できないこと' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'shipping_period_idが空なら登録できないこと' do
      @item.shipping_period_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping period can't be blank")
    end
    it 'priceが空なら登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceに文字が入っていたら登録できないこと' do
      @item.price = 'きんがく'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceに300より小さい金額が入っていたら登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceに9,999,999より大きい金額が入っていたら登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
